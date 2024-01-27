if instance_exists(obj_dipper) switch stage {
	case 0: with obj_dipper {
		if canMove if x >= 790 other.stage++
	} break
	case 1: with obj_dipper {
		if canMove { if x <= 760 {
			canMove = false
			audio_stop_all()
			other.alarm[0] = 120
			camera_set_view_target(view_camera[0],noone)
		}}
		else if other.alarm[0] > -1 if other.alarm[0] < 60 camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-1,0)
	} break
	case 2:
		if !audio_is_playing(mus_danger) audio_play_sound(mus_danger,0,false)
		if image_alpha < 1 image_alpha += .005
		else if alarm[0] == -1 alarm[0] = 60
	break
	case 3:
		if index < 7 {
			if index == 0 audio_play_sound(sfx_wendyne_axe_appear,0,false)
			index += .25
		}
		else if alarm[1] == -1 if alarm[2] == -1 alarm[1] = 120
	break
	case 4:
		if alpha < 1 alpha += .01
		else if alarm[0] == -1 alarm[0] = 90
	break
	case 5:
		if alarm[3] == -1 {
			event_perform(ev_alarm,3)
			audio_play_sound(sfx_fall,0,false)
			obj_dipper.vspeed = 1
		}
		if obj_dipper.vspeed > 0 if obj_dipper.y >= 260 with obj_toRoom {
			room_persistent = false
			alarm[1] = 1
			goto = rm_cav_15_intermission
			music = noone
			obj_dipper.vspeed = 0
		}
	break
}