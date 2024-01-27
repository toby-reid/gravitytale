if global.killed[enemy.qt] or global.spared[enemy.qt] or global.spared[enemy.ghosts] instance_destroy()
else {
	image_speed = 0
	alarm[0] = 25
	grow = true
	
	stage = 0
	if !variable_global_exists("ghost") global.ghost = 0
}