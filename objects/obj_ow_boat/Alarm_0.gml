/// @description fade out
if alpha < 1 {
	alpha += .02
	if !audio_is_playing(mus_wind)
		audio_group_set_gain(Music,audio_sound_get_gain(mus_birds)-.1,0)
	alarm[0] = 1
}
else {
	global.dir = 3
	room_persistent = false
	if !audio_is_playing(mus_wind) {
		audio_stop_all()
		audio_group_set_gain(Music,1,0)
		audio_play_sound(mus_wind,0,true)
	}
	room_goto(rm_lake)
}