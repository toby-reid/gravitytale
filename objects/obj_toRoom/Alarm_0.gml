/// @description Fade in
if alpha > 0 {
	if alpha == 1 {
		if instance_exists(obj_dipper) {
			if !global.teleport if global.toRoom_num == num switch dir {
				case 0: if global.dir == 2 {
					obj_dipper.x = x-10
					obj_dipper.y = y+10*image_yscale
				} break
				case 1: if global.dir == 3 {
					obj_dipper.x = x+10*image_xscale
					obj_dipper.y = y+20*image_yscale+10
				} break
				case 2: if global.dir == 0 {
					obj_dipper.x = x+20*image_xscale+10
					obj_dipper.y = y+10*image_yscale
				} break
				case 3: if global.dir == 1 {
					obj_dipper.x = x+10*image_xscale
					obj_dipper.y = y-10
				} break
			}
		}
	}
	alpha -= .1
	alarm[0] = 1
}
else {
	if instance_exists(obj_dipper) obj_dipper.canMove = true
	room_persistent = true
}