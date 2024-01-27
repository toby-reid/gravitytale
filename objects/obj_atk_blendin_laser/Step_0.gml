switch stage {
	case 0: if y >= 380 {
		direction = dir
		image_angle = direction+90
		stage++
	} break
	case 1: if x <= 248 or x >= 392 {
		direction = 90
		image_angle = 180
		stage++
	} break
	case 2: if y <= 260 {
		direction = dir-180
		image_angle = direction+90
		stage++
	} break
	case 3:
		if x-2 <= obj_soul.x and x+2 >= obj_soul.x {
			direction = 270
			image_angle = 0
			stage++
		}
		if x-2 <= 320 and x+2 >= 320 {
			direction = 270
			image_angle = 0
			stage = 0
			dir = dir+180
		}
	break
	case 4: if y >= 480 instance_destroy() break
}
