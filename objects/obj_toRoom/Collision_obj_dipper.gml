if obj_dipper.canMove {
	if alarm[0] > -1 or alarm[1] > -1 switch dir {
		case 0: obj_dipper.x -= 2 break
		case 1: obj_dipper.y += 2 break
		case 2: obj_dipper.x += 2 break
		case 3: obj_dipper.y -= 2 break
	} else {
		obj_dipper.canMove = false
		room_persistent = false
		alarm[1] = 1
	}
}