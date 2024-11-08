if instance_exists(obj_dipper) switch stage {
	case 0: with obj_dipper if(canMove and moving) or !canMove other.alarm[0] = 1500 break
	case 1: if image_index >= 37 {
		image_speed = 0
		image_index = 37
		alarm[1] = 420
		if !audio_is_playing(mus_wind) {
			audio_sound_gain(mus_wind,0,0)
			audio_play_sound(mus_wind,0,true)
		}
		stage++
	} break
	case 2: 
		if(alpha < 1) alpha += .005
		if audio_sound_get_gain(mus_wind) < 1 audio_sound_gain(mus_wind,audio_sound_get_gain(mus_wind)+.01,0)
		break
	case 3: 
		if !instance_exists(obj_textbox) {
			audio_stop_sound(mus_dgame)
			with instance_create_layer(0,0,layer,obj_toBattle) {
				music = silence
				goto = btl_wayman
			}
			stage++
		} 
		else with obj_textbox if page >= 0 if string_copy(text[page],1,3) == "Oi," if !audio_is_playing(mus_dgame) {audio_stop_sound(mus_wind); audio_play_sound(mus_dgame,0,true)}
		break
	case 4:
		if !instance_exists(obj_toBattle) {//we've defeated the Wayman
			audio_group_stop_all(Wayman)
			audio_group_unload(Wayman)
			obj_dipper.canMove = false
			image_index = 0
			if(alpha > 0) alpha -= .005
			else {
				obj_dipper.canMove = true
				if global.enemy_killed[ENEMY.WAYMAN] or global.enemy_spared[ENEMY.WAYMAN]//won't make textbox if we just ran
					if prev with instance_create_layer(160,192,layer,obj_textbox) {
						text = [
							"(You can now use Portal-#Potties.)",
							". . .",
							"(You already could do that...)",
							"(Well, I guess the mazes were #just that good, eh?&(You just had to return?)",
							"(Ok bye)"
						]
					}
					else with instance_create_layer(160,192,layer,obj_textbox) {
						text = [
							"(You can now use Portal-#Potties.)",
							"(Well done...)",
							". . .",
							"(Like a steak...)",
							". . .",
							"(Yeeeah...&(This was a misteak.)"
						]
					}
				instance_destroy()
			}
		}
		break
}