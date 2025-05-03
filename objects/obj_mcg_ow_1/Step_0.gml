if (instance_exists(obj_dipper)) switch (stage) {
	case 0:
		if (obj_dipper.x >= 270 and obj_dipper.y <= 150 and obj_dipper.y >= 110) {
			obj_dipper.canMove = false;
			alarm[0] = (global.player.genocide == RUN.ACTIVE) ? 30 : 120;
			stage++;
		}
		break;
	case 1:
		if (alarm[0] == -1) {
			vspeed += .05;
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
				audio_sound_pitch(sfx_whoosh, 1);
				audio_play_sound(sfx_grass, 0, false);
			}
		}
		break;
	case 2:
		if (alarm[1] == -1 and !instance_exists(obj_textbox)) {
			audio_group_stop_all(Music);
			audio_play_sound(sfx_ding, 0, false);
			sprite_index = spr_mcg_r;
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
			audio_group_stop_all(Music);
			audio_play_sound(sfx_click, 0, false);
			alarm[3] = 60;
			stage++;
		} else with obj_textbox {
			if (page >= 0 and sound[page] == tlk_gideon and charCount < string_length(text[page])) with obj_ford_ow_1 {
				arm_index += .1;
				while (arm_index >= 2) {
					arm_index -= 2;
				}
			} else {
				obj_ford_ow_1.arm_index = 0;
			}
		}
		break;
	case 9:
		if (alarm[3] == -1) {
			obj_dipper.image_alpha -= .01;
			if (obj_dipper.image_alpha == 0) {
				stage++;
			}
		}
		break;
	case 10:
		if (alpha == 1) {
			room_set_persistent(room, false);
			audio_group_stop_all(Music);
			audio_play_sound(mus_wind, 0, true);
			room_goto(ow_min_02_start);
		} else {
			alpha += .05;
		}
		break;
}
