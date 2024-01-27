stage++
if stage <= image_xscale {
	obj_dipper.canMove = false
	if !audio_is_playing(sfx_moveRock) audio_play_sound(sfx_moveRock,0,true)
	audio_play_sound(sfx_sans_pound,0,false)
	alarm[0] = 60
	if stage == image_xscale {
		if audio_is_playing(sfx_moveRock) {
			audio_stop_sound(sfx_moveRock)
			if global.player[player.runActive] == 2 audio_play_sound(sfx_puzDone_distort,0,false)
			else audio_play_sound(sfx_puzDone,0,false)
		}
		alarm[1] = -1
		camera_set_view_pos(view_camera[0],cam[0],cam[1])
	}
	event_user(0)
}
else {
	obj_dipper.canMove = true
	camera_set_view_target(view_camera[0],obj_dipper)
	instance_destroy()
}