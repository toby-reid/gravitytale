if instance_exists(obj_dipper) switch stage {
	case 0: if obj_dipper.canMove if obj_dipper.x >= x {
		obj_dipper.canMove = false
		audio_stop_all()
		alarm[0] = 60
	} break
	case 1:
		if instance_exists(obj_textbox) {
			if obj_textbox.page == 5 {
				if alarm[1] == -1 alarm[1] = 81
				if keyboard_check_pressed(vk_shift) event_user(0)
			}
		}
	break
	case 2: if !instance_exists(obj_toBattle) {
		with instance_create_layer(160,192,layer,obj_textbox) {
			text = [
				"(. . .)",
				"(That was...`#unsettling.)",
				"(But, oh well...&(At least it's no longer after #your ",
				"(Either way, time to move out.)"
			]
			if global.player[player.mabel] text[2] += "hand in marriage"
			else text[2] += "sister"
			if global.spared[enemy.bmgnome] text[2] += "...```right?)"
			else text[2] += ".)"
			for(var i = 0; i < array_length(text); i++) charRate[i] = 3
		}
		stage++
	} break
	case 3:
		if !instance_exists(obj_textbox) instance_destroy()
		else obj_dipper.canMove = false
	break
}