if !audio_is_playing(mus_snowy) {
	audio_stop_all()
	audio_play_sound(mus_snowy,0,true)
}
obj_dipper.canMove = true