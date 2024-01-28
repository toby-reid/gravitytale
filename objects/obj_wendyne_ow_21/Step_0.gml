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
		else switch obj_textbox.page {
			case 1:
			case 3:
				sprite_index = spr_wendyne_l;
				break;
			case 2:
			case 4:
			case 7:
				sprite_index = spr_wendyne_d;
				break;
			case 5:
				sprite_index = spr_wendyne_r;
				break;
		}
		break;
	case 2://NGAHHH
		if(alarm[0] == -1) {
			if(!instance_exists(obj_textbox)) {
				audio_stop_sound(mus_wind);
				audio_sound_gain(mus_wind,1,0);
				if(global.killed[enemy.manlydan] and global.player[player.runActive] != 2) {
					stage++;
				}
				else with instance_create_layer(160,192,layer,obj_textbox) {
					text = [
						". . .",
						"No, you know what?",
						"Screw it!!",
						"Speeches are for politicians!&Now is the time for action!",
						"We'll never be strong enough #to fight the @ffff00monster @ffffffif we're #stuck in storytime!"
					];
				}
			}
			else {
				if(!audio_is_playing(mus_ngahhh)) if(obj_textbox.page == 1) audio_play_sound(mus_ngahhh,0,true);
				if(obj_textbox.alarm[2] > -1) {
					alpha = 1;
					var _cam = view_camera[0];
					camera_set_view_size(_cam,camera_get_view_x(_cam)-40,camera_get_view_y(_cam)-30);
					camera_set_view_target(_cam,id);
					camera_set_view_angle(_cam,-30 + irandom(60));
				}
				else if(alpha > 0) alpha -= .05;
				if(obj_textbox.grow < 0) stage++;
			}
		}
		break;
	case 3://fadeflash
		if(!instance_exists(obj_textbox)) {
			if(alpha < 1) alpha += .01;
			else {
				var _cam = view_camera[0];
				camera_set_view_size(_cam,320,240);
				camera_set_view_target(_cam,noone);
				camera_set_view_angle(_cam,0);
				camera_set_view_pos(_cam,0,80);
				sprite_index = spr_wendyne_helmet;
				stage++;
			}
		}
		break;
	case 4:
		if(alpha > 0) alpha -= .05;
		else {
			image_speed = 1;
			if(image_index >= 8) {
				image_speed = 0;
				if(alarm[0] == -1) alarm[0] = 60;
				else if(alarm[0] == 0) {
					with instance_create_layer(160,192,layer,obj_textbox) {
						if(global.player[player.runActive] == 2) {//geno
							
						}
						else if(global.killed[enemy.manlydan]) {
							text = [
								". . .",
								"Forget it.",
								"My father hasn't returned #from the woods since @ffff00you #@ffffffcame.",
								"I mean, say what you #want about him.",
								"He's weird,` #he's rambunctious,` #he's destructive.",
								"But he has NEVER failed #to protect my town... my #family.",
								". . .",
								"But now he's gone.",
								". . .",
								"What did you do to him?",
								"What did you DO TO HIM?",
								"\"Manly Dan\", the #unstoppable force...",
								". . .",
								"Go ahead.&Prepare however you want.",
								"But when you step #forward...`` when you walk #into that trap...",
								"I will KILL you."
							];
							head = [
								spr_wendy_head_closed,
								spr_wendy_head_happy,
								spr_wendy_head_closed,
								spr_wendy_head_side,
								spr_wendy_head_side,
								spr_wendy_head_ohcrap,
								spr_wendy_head_closed,
								spr_wendy_head_happy,
								spr_wendy_head_closed,
								spr_wendy_head_ohcrap,
								spr_wendy_head_anger,
								spr_wendy_head_happy,
								spr_wendy_head_closed,
								spr_wendy_head_ohcrap,
								spr_wendy_head_closed,
								spr_wendy_head_anger
							];
							charRate[array_length(text)-1] = 4;
						}
						else if(global.player[player.kills] == 0) {//paci
							
						}
						else {//neut but ManDan alive
							
						}
					}
				}
			}
		}
}