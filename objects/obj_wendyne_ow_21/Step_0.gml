if(instance_exists(obj_dipper)) switch stage {
	case 0:
		if(obj_dipper.y <= 720) if(alarm[1] == -1) {
			if(obj_dipper.canMove) {
				obj_dipper.canMove = false;
				obj_dipper.dir = 1;
				alarm[0] = 30;
				camera_set_view_target(view_camera[0],noone);
			}
			else if(alarm[0] == -1) {
				var _viewy = camera_get_view_y(view_camera[0]);
				if(_viewy > 80) camera_set_view_pos(view_camera[0],0,_viewy-1);
				else alarm[1] = 30;
			}
		}
		break;
	case 1:
		if(!instance_exists(obj_textbox)) {
			alarm[0] = 30;
			stage++;
			audio_sound_gain(mus_wind,0,500);
		}
		break;
	case 2:
		if(alarm[0] == -1) {
			if(!instance_exists(obj_textbox)) {
				audio_stop_sound(mus_wind);
				audio_sound_gain(mus_wind,1,0);
				with instance_create_layer(160,192,layer,obj_textbox) {
					if(global.killed[enemy.manlydan]) {
						text = [
							". . .",
							"Forget it.",
							"Look.&My father hasn't returned from the woods since @ffff00you @ffffffcame.",
							"Say what you want about him.",
							"He's weird,` he's rambunctious,` he's destructive.",
							"But he has ALWAYS protected this town... our family.",
							". . .",
							"But now he's gone.",
							". . .",
							"What did you do to him?",
							"What did you DO TO HIM?",
							"\"Manly Dan\", the hero of the Oddpocalypse...",
							". . .",
							"Go ahead.&Prepare however you want.",
							"But when you step forward...&When you walk into that trap...",
							"I will KILL you."
						]
						head = [
							
						]
						charRate[array_length(text)-1] = 4;
					}
				}
			}
			else {
				
			}
		}
}