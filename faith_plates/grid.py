"""TODO"""

import sys
from dataclasses import dataclass, field
from enum import IntEnum
from functools import cached_property
from pathlib import Path
from typing import Any, Optional, Self, cast, get_origin

import yaml

Row = int
Column = int


class Direction(IntEnum):
    """TODO"""

    RIGHT = 0
    UP = 1
    LEFT = 2
    DOWN = 3


@dataclass(order=True, slots=True, frozen=True)
class Coordinate:
    """TODO"""

    ConfigT = dict[str, Row | Column]

    row: Row
    col: Column

    def __str__(self):
        return f"({self.row},{self.col})"

    @cached_property
    def neighbors(self) -> list[Self]:
        """TODO"""
        return [
            self.__class__(self.row, self.col + 1),
            self.__class__(self.row - 1, self.col),
            self.__class__(self.row, self.col - 1),
            self.__class__(self.row + 1, self.col),
        ]

    @classmethod
    def from_json(cls, config: ConfigT) -> Optional[Self]:
        """TODO"""
        try:
            return cls(**config)
        except TypeError as e:
            print(f"Error parsing coordinates from {config}: {e}")
            return None

    def get_directions(self, direction: Optional[Direction]) -> set[Self]:
        """TODO"""
        if direction is not None:
            return {self.neighbors[direction]}
        return set(self.neighbors)


@dataclass(order=True, slots=True, frozen=True)
class Plate:
    """TODO"""

    ConfigT = dict[str, Optional[Direction | bool]]

    coordinate: Coordinate
    direction: Optional[Direction]
    is_strong: bool
    at_start: bool
    reaches_end: bool

    @classmethod
    def from_json(cls, coordinate: Coordinate, config: Optional[ConfigT]) -> Optional[Self]:
        """TODO"""
        if config is None:
            return None
        try:
            direction = _get_value(config, "direction", Direction, default=None, none_ok=True)
            is_strong = _get_value(config, "is_strong", bool, default=False)
            at_start = _get_value(config, "at_start", bool, default=False)
            reaches_end = _get_value(config, "reaches_end", bool, default=False)
        except KeyError as e:
            print(f"Error parsing {config} at {coordinate}: {e}")
            return None
        return cls(
            coordinate, direction, is_strong=is_strong, at_start=at_start, reaches_end=reaches_end
        )


@dataclass(slots=True, init=False)
class Config:
    """TODO"""

    ConfigT = list[list[Plate.ConfigT]]

    plates: dict[Coordinate, Plate] = field(default_factory=dict)
    starting_plates: set[Coordinate] = field(default_factory=set)
    ending_plates: set[Coordinate] = field(default_factory=set)

    @classmethod
    def from_json(cls, config: ConfigT) -> Optional[Self]:
        """TODO"""
        config_obj = cls()
        for row_index, row in enumerate(config):
            for col_index, plate_config in enumerate(row):
                coordinate = Coordinate(row_index, col_index)
                plate = Plate.from_json(coordinate, plate_config)
                if plate is not None:
                    config_obj.plates[coordinate] = plate
                    if plate.at_start:
                        config_obj.starting_plates.add(coordinate)
                    if plate.reaches_end:
                        config_obj.ending_plates.add(coordinate)
        if not config_obj.starting_plates or not config_obj.ending_plates:
            print(f"Config {config} has no starting and/or ending plates")
            return None
        return config_obj


@dataclass(slots=True)
class Graph:
    """TODO"""

    full_map: dict[Optional[Coordinate], set[Optional[Plate]]]

    @classmethod
    def from_config(cls, config: Config) -> Self:
        """TODO"""
        full_map: dict[Optional[Coordinate], set[Optional[Plate]]] = {None: set()}
        for coord, plate in config.plates.items():
            connections: set[Optional[Plate]] = set()
            for connection_coord in coord.get_directions(plate.direction):
                if connection_coord in config.plates:
                    connections.add(config.plates[connection_coord])
            if plate.at_start:
                full_map[None].add(plate)
            if plate.reaches_end:
                connections.add(None)
            full_map[coord] = connections
        return cls(full_map)

    def find_path_to_exit(self) -> Optional[list[Coordinate]]:
        """TODO"""
        reached_coords: set[Coordinate] = set()
        queue: list[list[Coordinate]] = [
            [plate.coordinate] for plate in self.full_map[None] if plate is not None
        ]
        while queue:
            path_to_check = queue.pop(0)
            reached_coord = path_to_check[-1]
            if reached_coord in reached_coords:
                continue
            for next_plate in self.full_map[reached_coord]:
                if next_plate is None:
                    return path_to_check
                queue.append(path_to_check + [next_plate.coordinate])
            reached_coords.add(reached_coord)
        return None


def main(args: list[str]) -> int:
    """TODO"""

    if not args:
        print("Requires YAML or JSON configuration file as arg 1")
        return 1
    input_file = Path(args[0]).resolve()
    with input_file.open('r', encoding="utf-8") as file:
        config_file = yaml.safe_load(file)
    config = Config.from_json(config_file)
    if config is None:
        return 1
    graph = Graph.from_config(config)
    path_to_exit = graph.find_path_to_exit()
    if path_to_exit is None:
        print("No path to exit")
        return 2
    print(f"Shortest path to exit: {path_to_exit}")
    return 0


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
    sys.exit(main(sys.argv[1:]))
