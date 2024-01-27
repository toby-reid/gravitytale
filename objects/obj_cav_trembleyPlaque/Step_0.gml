if !instance_exists(obj_textbox) switch stage {
	case 1: if alarm[0] == -1 {
		if obj_ford_ow_1.vspeed == 0 {
			alarm[0] = 240
			audio_stop_all()
		}
		else if obj_ford_ow_1.y >= 80 {
			obj_ford_ow_1.vspeed = 0
			alarm[1] = 90
			audio_play_sound(sfx_sans_pound,0,false)
			stage++
		}
	} break
	case 2:
		if audio_is_playing(sfx_sans_pound) obj_dipper.y++
	break
	case 3: 
		if !instance_exists(obj_toBattle) {
			if global.killed[enemy.qt] {
				instance_destroy()
				with instance_create_layer(160,192,layer,obj_textbox) {
					text = [
						"(. . .)",
						"(He left you with a -12 #dollar bill.&(It's less than worthless.)",
						"(No use crying about it now #though.)"
					]
				}
			}
			else if alarm[1] == -1 alarm[1] = 60
		}
		obj_dipper.canMove = false
	break
	case 4: if obj_ford_ow_1.y <= -100 {
		obj_dipper.canMove = true
		audio_play_sound(mus_waterquiet,0,true)
		instance_destroy()
	} break
}