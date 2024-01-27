/// @description The Wayman appears!
var appear = false
x = obj_dipper.x
if stage == 0 switch room {
	case ow_fst_1_meetStans:
		if !instance_exists(obj_stans_ow_1) or obj_dipper.x < 900 {
			appear = true
			if(x > 993 and x < 1246) y = 20
			else y = 80
		}
		break
	case ow_fst_22_caves:
		if obj_dipper.y <= 120 {
			appear = true
			if(x < 290) y = 0
			else y = 20
		}
		break
}

if appear {
	obj_dipper.canMove = false
	image_speed = 1
	stage = 1
	audio_stop_all()
	audio_group_load(Wayman)
}