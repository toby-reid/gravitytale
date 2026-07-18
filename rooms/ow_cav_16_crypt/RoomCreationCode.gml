if !audio_is_playing(mus_mysterious) {
	audio_stop_all()
	audio_play_sound(mus_mysterious,0,true)
}
if (global.wendy < 16)
{
    global.wendy = 16;
}
