if hspeed != 0 {
	hspeed = 0
	image_speed = 1
	//all the at values
		 if alarm[1] >= 61 global.stage[4] = 1
	else if alarm[1] >= 47 global.stage[4] = 2
	else if alarm[1] >= 38 global.stage[4] = 3
	else if alarm[1] >= 32 global.stage[4] = 5
	else if alarm[1] >= 23 global.stage[4] = 3
	else if alarm[1] >=  9 global.stage[4] = 2
	else if alarm[1] >=  1 global.stage[4] = 1
	else global.stage[4] = 0
	if global.player[player.nyarf] >= 4 global.stage[4] *= 2
}