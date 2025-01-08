if (instance_exists(obj_dipper)) switch (stage) {
	case 0:
		if (obj_dipper.x >= 270) {
			obj_dipper.canMove = false;
			alarm[0] = (global.player.genocide == RUN.ACTIVE) ? 30 : 120;
			stage++;
		}
		break;
	case 1:
		if (alarm[0] == -1) {
			vspeed += .01;
			if (draw_y < sprite_height) {
				draw_y++;
			} else {
				drawy = -1; // indicates to 'Draw' event to draw full self
			}
			if (y >= 120) {
				vspeed = 0;
				y = 120;
				alarm[1] = 45 + irandom(30);
				stage++;
			}
		}
		break;
	case 2:
		if (!instance_exists(obj_textbox)) {
			audio_stop_sound(mus_alphys);
			audio_play_sound(sfx_ding, 0, false);
			with instance_create_layer(520, 110, layer, obj_ford_ow_1) {
				arm = spr_gideon_tv_arm_move;
				arm_index = sprite_get_number(spr_gideon_tv_arm_move) - 1;
				face = spr_gideon_tv_face_cheery;
				sprite_index = spr_gideon_tv;
				image_speed = 0;
			}
			alarm[2] = 90;
			stage++;
		}
		break;
	// cases 3-7 covered entirely in alarm[2]
	case 8:
		if (!instance_exists(obj_textbox)) {
			audio_stop_sound(mus_showtime);
			audio_play_sound(sfx_click, 0, false);
			alarm[3] = 60;
			stage++;
		}
		break;
	case 9:
		if (alarm[3] == -1) {
			obj_dipper.image_alpha -= .01;
			if (obj_dipper.image_alpha == 0) {
				with instance_create_layer(-20, -20, layer, obj_toRoom) {
					goto = ow_min_02_start;
					dir = 3;
					music = mus_wind;
					event_perform(ev_alarm, 1);
				}
				stage++;
			}
		}
		break;
	// case 10 for use by obj_toRoom
}
