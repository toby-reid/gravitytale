if image_alpha == 1 if obj_soul.alarm[0] == -1 {
	global.player[player.hp] -= at
	obj_soul.alarm[0] = 45
	obj_soul.image_blend = c_silver
	audio_play_sound(sfx_damageTaken,0,false)
}