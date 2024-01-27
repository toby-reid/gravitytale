if global.stage[4] != -1 {
	image_speed = 1
	if image_index >= image_number-1 image_speed = 0
	if image_index == 1 {
		global.stage[0]++
		if global.player[player.mabel] and global.player[player.nyarf] >= 4 audio_play_sound(sfx_pound,0,false)
		else audio_play_sound(sfx_attack,0,false)
		/*if instance_exists(obj_stans_battle) with obj_stans_battle {
			path_end()
			hspeed = -5
			alarm[7] = 80
			x = 320
			y = ystart
		}*/
	}
	else if image_index == 3 {
		if global.stage[4] > 0 {
			audio_play_sound(sfx_damageDealt,0,false)
			target.hp -= global.stage[4]
		}
		else audio_play_sound(sfx_whoosh,0,false)
		alarm[0] = 45
	}
}