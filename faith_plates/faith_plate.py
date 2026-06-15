"""TODO"""

import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Optional, cast, get_origin

import yaml

PlateName = str
GroupName = str


@dataclass(kw_only=True, order=True, slots=True)
class Plate:
    """TODO"""

    ConfigT = dict[str, PlateName | GroupName | bool | list[str]]

    name: PlateName
    sends_to_group: GroupName
    starts_active: bool = field(default=True)
    toggles_plates: set[PlateName] = field(default_factory=set)

    @classmethod
    def from_json(
        cls, group_name: GroupName, name: PlateName, config: ConfigT
    ) -> Optional["Plate"]:
        """TODO"""
        try:
            sends_to_group = _get_value(config, "sends_to_group", GroupName, group_name)
            plate = cls(name=name, sends_to_group=sends_to_group)
        except KeyError as e:
            print(f"Error parsing {config}: {e}")
            return None
        plate.starts_active = _get_value(config, "starts_active", bool, default=True)
        plate.toggles_plates = set(
            _get_value(config, "toggles_plates", list[PlateName], default=[])
        )
        return plate


@dataclass(kw_only=True, slots=True)
class Config:
    """TODO"""

    ConfigT = dict[str, PlateName | GroupName | dict[GroupName, dict[PlateName, Plate.ConfigT]]]

    groups: dict[GroupName, dict[PlateName, Plate]] = field(default_factory=dict)
    start_group: Optional[GroupName] = None
    end_group: Optional[GroupName] = None
    ok_deadend_groups: set[GroupName] = field(default_factory=set)

    @classmethod
    def from_json(cls, config: ConfigT) -> Optional["Config"]:
        """TODO"""
        try:
            config_obj = cls()
            groups = _get_value(config, "groups", dict[GroupName, dict[PlateName, Plate.ConfigT]])
            for group_name, plates in groups.items():
                config_obj.groups[group_name] = {}
                if not isinstance(plates, dict):
                    continue
                for plate_name, plate_config in plates.items():
                    plate = Plate.from_json(group_name, plate_name, plate_config)
                    if plate is None:
                        print(f"Error parsing {config}")
                        return None
                    config_obj.groups[group_name][plate_name] = plate
        except KeyError as e:
            print(f"Error parsing {config}: {e}")
            return None
        config_obj.start_group = _get_value(
            config, "start_group", GroupName, default=sorted(config_obj.groups.keys())[0]
        )
        config_obj.end_group = _get_value(
            config, "end_group", GroupName, default=sorted(config_obj.groups.keys())[-1]
        )
        config_obj.ok_deadend_groups = set(
            _get_value(config, "ok_deadend_groups", list[GroupName], default=[])
        )
        return config_obj


@dataclass(slots=True)
class Graph:
    """TODO"""

    @dataclass(frozen=True, slots=True)
    class Node:
        """TODO"""

        current_group: GroupName
        last_plate: Optional[PlateName] = field(compare=False)
        active_state: dict[PlateName, bool]
        routes: list["Graph.Node"] = field(
            default_factory=list, init=False, repr=False, compare=False
        )

        @classmethod
        def from_start(
            cls, start_group: GroupName, full_map: dict[GroupName, dict[PlateName, Plate]]
        ) -> "Graph.Node":
            """TODO"""
            active_state: dict[PlateName, bool] = {}
            for plates in full_map.values():
                for plate_name, plate in plates.items():
                    active_state[plate_name] = plate.starts_active
            start = Graph.Node(start_group, None, active_state)
            start.make_connections(full_map, [start])
            return start

        def is_dead_end(self) -> bool:
            """TODO"""
            return len(self.routes) == 0

        def make_connections(
            self,
            full_map: dict[GroupName, dict[PlateName, Plate]],
            known_nodes: list["Graph.Node"],
        ) -> None:
            """TODO"""
            for plate_name, plate in full_map[self.current_group].items():
                if self.active_state[plate_name]:
                    connection = self._step_plate(plate)
                    if connection not in known_nodes:
                        known_nodes.append(connection)
                        known_nodes.append(connection)
                        self.routes.append(connection)
                        connection.make_connections(full_map, known_nodes)
                    else:
                        connection_index = known_nodes.index(connection)
                        connection = known_nodes[connection_index]
                        found_connection = False
                        for route in self.routes:
                            if route == connection:
                                found_connection = True
                                break
                        if not found_connection:
                            self.routes.append(known_nodes[connection_index])

        def _step_plate(self, on_plate: Plate) -> "Graph.Node":
            """TODO"""
            new_group = on_plate.sends_to_group
            now_active = self.active_state.copy()
            for affected_plate in on_plate.toggles_plates:
                now_active[affected_plate] = not now_active[affected_plate]
            return Graph.Node(new_group, on_plate.name, now_active)

        def __str__(self):
            return (
                self.current_group
                if self.last_plate is None
                else f"{self.last_plate} -> {self.current_group}"
            )

    END_GROUP = "END"

    start_state: Node
    end_group: GroupName
    ok_dead_ends: set[GroupName]
    full_map: dict[GroupName, dict[PlateName, Plate]]

    @classmethod
    def from_config(cls, config: Config) -> Optional["Graph"]:
        """TODO"""
        full_map = config.groups
        start_group = config.start_group
        end_group = config.end_group
        if start_group not in full_map or end_group not in full_map:
            print(f"Start group {start_group} or end group {end_group} not in full map {full_map}")
            return None
        start_node = Graph.Node.from_start(start_group, full_map)
        ok_dead_ends = config.ok_deadend_groups.union({end_group})
        return Graph(start_node, end_group, ok_dead_ends, full_map)

    def has_dead_ends(self) -> bool:
        """TODO"""
        checked_nodes: list[Graph.Node] = []
        queue = [[self.start_state]]
        while queue:
            path = queue.pop(0)
            next_check = path[-1]
            if next_check in checked_nodes:
                continue
            if next_check.is_dead_end() and next_check.current_group not in self.ok_dead_ends:
                print(
                    f"Dead end found in state {next_check} "
                    f"(Path to reach: {[str(node) for node in path]})"
                )
                return True
            queue.extend((path + [route]) for route in next_check.routes)
            checked_nodes.append(next_check)
        return False

    def check_plate_names(self) -> bool:
        """TODO"""
        all_plates = [
            plate_name for plates in self.full_map.values() for plate_name in plates.keys()
        ]
        unique_plates = set(all_plates)
        if len(all_plates) != len(unique_plates):
            print(f"Encountered duplicate plate(s): {all_plates} / {unique_plates}")
            return False
        for plates in self.full_map.values():
            for plate in plates.values():
                for toggles_plate in plate.toggles_plates:
                    if toggles_plate not in unique_plates:
                        print(f"Toggled plate {toggles_plate} not found in all plates")
                        return False
        return True

    def find_path_to_exit(self) -> Optional[list[Node]]:
        """TODO"""
        checked_nodes: list[Graph.Node] = []
        queue = [[self.start_state]]
        while queue:
            path_to_check = queue.pop(0)
            check_node = path_to_check[-1]
            if check_node in checked_nodes:
                continue
            if check_node.current_group == self.end_group:
                return path_to_check
            queue.extend((path_to_check + [next]) for next in check_node.routes)
            checked_nodes.append(check_node)
        return None


def main() -> None:
    """TODO"""

    input_file = Path(sys.argv[1]).resolve()
    with input_file.open("r", encoding="utf-8") as file:
        input_config = yaml.safe_load(file)
    config = Config.from_json(input_config)
    if config is None:
        return
    graph = Graph.from_config(config)
    if graph is None:
        return
    assert not graph.has_dead_ends()
    print("No dead ends")
    assert graph.check_plate_names()
    print("Plate names ok")
    path_to_exit = graph.find_path_to_exit()
    assert path_to_exit is not None
    print(f"Shortest path to exit: {[str(node) for node in path_to_exit]}")


def _get_value[KeyT, ValueT](
    d: dict[KeyT, Any],
    key: KeyT,
    value_type: type[ValueT],
    default: Optional[ValueT] = None,
    none_ok: bool = False,
) -> ValueT:
    """TODO"""
    if key not in d:
        if default is None and not none_ok:
            raise KeyError(f"Key {key} not found in dictionary {d}")
        return cast(ValueT, default)
    value = d[key]
    if not isinstance(value, get_origin(value_type) or value_type):
        raise TypeError(f"Value for {key}, {value}, is not of type {value_type}")
    return value


if __name__ == "__main__":
    main()
