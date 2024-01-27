/// @description Set goto, play music

if !audio_is_playing(music)
	if music != noone
		audio_play_sound(music,0,true)
if instance_exists(obj_battleCore) {
	obj_battleCore.goto = prev
	obj_battleCore.music = prevMusic
}

instance_destroy()