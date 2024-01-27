/// @description Fade out
if alpha < 1 {
	if alpha == 0 if door audio_play_sound(sfx_door,0,false)
	alpha += .1
	alarm[1] = 1
	if music != noone if !audio_is_playing(music) {
		audio_group_set_gain(Music,audio_sound_get_gain(mus_birds)-.1,0)
	}
}
else {
	if instance_exists(obj_dipper) with obj_dipper switch other.dir {
		case 0: x -= 2; dir = 2 break
		case 1: y += 2; dir = 3 break
		case 2: x += 2; dir = 0 break
		case 3: y -= 2; dir = 1 break
	}
	obj_toRoom.alarm[0] = 1
	obj_toRoom.alpha = 1
	if music != noone if !audio_is_playing(music) {
		audio_group_stop_all(Music)
		audio_play_sound(music,0,true)
	}
	global.dir = dir
	global.toRoom_num = num
	room_persistent = setPers
	/*temp, to override persistency*/global.toRoom = true
	room_goto(goto)
}