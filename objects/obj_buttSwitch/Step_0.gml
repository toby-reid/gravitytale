if !done {
	if pressed != noone {
		if active > -1 if active < array_length(order) if order[active] == pressed {//it's the right button
			active++
			if active == array_length(order) {done = true; global.buttSwitch[array_length(global.buttSwitch)] = room}
		}
		else active = 0
	}
}

pressed = noone