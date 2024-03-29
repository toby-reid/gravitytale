/// @description let 'er rip
if stage == 2 {
	if obj_ford_ow_1.image_index < 2 {
		obj_ford_ow_1.image_index++
		if obj_ford_ow_1.image_index == 2 audio_play_sound(sfx_fabric_rip,0,false)
		alarm[1] = 60
	}
	else alarm[0] = 90
}
else if stage == 3 {
	if obj_ford_ow_1.image_index > 0 {
		obj_ford_ow_1.image_index--
		alarm[1] = 30
	}
	else {
		obj_ford_ow_1.vspeed = -10
		stage++
	}
}