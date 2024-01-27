if other.alarm[0] == -1 if image_alpha == 1 {
	global.player[player.hp] -= at
	if at >= 0 {
		other.alarm[0] = 45
		other.image_blend = c_silver
		audio_play_sound(sfx_damageTaken,0,false)
	}
	else {audio_play_sound(sfx_heal,0,false); if global.player[player.hp] > global.player[player.maxhp] global.player[player.hp] = global.player[player.maxhp]}
}