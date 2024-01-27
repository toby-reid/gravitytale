if !audio_is_playing(mus_waterfall) {
	audio_stop_all()
	audio_play_sound(mus_waterfall,0,true)
}
obj_dipper.canMove = true