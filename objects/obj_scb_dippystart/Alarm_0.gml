with obj_dipper if !canMove {
	if image_angle == 90 image_angle = 0
	else if dir == 0 dir = 2
	else {
		dir = 0
		canMove = true
		instance_destroy(other)
	}
}
alarm[0] = 60