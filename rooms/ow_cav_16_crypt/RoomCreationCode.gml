if !audio_is_playing(mus_mysterious) {
	audio_stop_all()
	audio_play_sound(mus_mysterious,0,true)
}
if (!variable_global_exists("wendyne") or global.wendyne < 14) global.wendyne = 14;