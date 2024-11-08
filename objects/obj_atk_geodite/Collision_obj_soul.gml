if other.alarm[0] == -1 if image_alpha == 1 {
	global.player.hp -= at
	other.alarm[0] = 45
	other.image_blend = c_silver
	audio_play_sound(sfx_damageTaken,0,false)
}