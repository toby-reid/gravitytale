if other.canMove {
	other.x += lengthdir_x(2,dir*90)
	other.y += lengthdir_y(2,dir*90)
	with instance_create_layer(160,192-144*(other.y > 140),"Instances",obj_textbox) {
		text = other.text
		style[0] = 5
	}
	for(var i = 0; i < array_length(global.inventory); i++) if global.inventory[i] == item.none {
		if array_length(text) == 3 global.inventory[i] = item.onion16
		else global.inventory[i] = item.onion04 + irandom(3)
	}
	other.dir = dir
	audio_sound_gain(mus_allstar,0,5000)
	instance_destroy()
}