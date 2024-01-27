if global.wendy < 1 global.wendy = 1
if !audio_is_playing(mus_wind) {audio_stop_all(); audio_play_sound(mus_wind,0,true)}