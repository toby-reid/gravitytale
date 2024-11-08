if !done {
	if pressed != noone {
		if active > -1 if active < array_length(order) if order[active] == pressed {//it's the right button
			active++
			if active == array_length(order) {
				done = true;
				array_push(global.buttSwitch, room_get_name(room));
			}
		}
		else active = 0
	}
}

pressed = noone