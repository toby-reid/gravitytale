if !instance_exists(obj_enemy_manDan) {
	if speed > 0 {direction = point_direction(x,y,320,320) + 20*(irandom(1)-.5); speed = -1; alarm[0] = 30}
	else speed = 2
}