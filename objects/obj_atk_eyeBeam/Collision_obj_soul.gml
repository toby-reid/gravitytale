if obj_soul.alarm[0] == -1 if (image_blend==c_aqua and obj_soul.moving) or (image_blend==c_orange and !obj_soul.moving) {
	global.player[player.hp] -= at
	obj_soul.alarm[0] = 45
	obj_soul.image_blend = c_silver
	audio_play_sound(sfx_damageTaken,0,false)
}