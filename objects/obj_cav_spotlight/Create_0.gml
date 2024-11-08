if global.enemy_killed[ENEMY.TREMBLEY] or global.enemy_spared[ENEMY.TREMBLEY] or global.enemy_spared[ENEMY.GHOSTS] {
	instance_destroy()
} else {
	image_speed = 0
	alarm[0] = 25
	grow = true
	
	stage = 0
	if !variable_global_exists("ghost") global.ghost = 0
}