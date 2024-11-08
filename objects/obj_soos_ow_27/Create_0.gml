image_speed = 0
if variable_global_exists("soos") {
	if global.soos >= 27 if(global.enemy_killed[ENEMY.SOOS] or global.enemy_spared[ENEMY.SOOS]) 
		instance_destroy()
} else global.soos = 0
active = false