if canMove {
	canMove = false
	menu[0] = 1
	audio_play_sound(sfx_beep,0,false)
}
else if menu[0] > 0 if !instance_exists(obj_textbox) {
	menu[0] = 0
	canMove = true
	audio_play_sound(sfx_beep,0,false)
}