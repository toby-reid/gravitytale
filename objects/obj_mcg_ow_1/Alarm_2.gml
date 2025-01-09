/// @description He's a-coming!
with obj_ford_ow_1 {
	switch (other.stage) {
		case 3:
			if (x > 370 or arm_index != 0) {
				switch (arm_index) {
					case 0:
						arm_index = 1;
						audio_play_sound(sfx_sans_pound, 0, false);
						other.alarm[2] = 30;
						break;
					case 1:
						arm_index = 2;
						audio_play_sound(sfx_grass, 0, false);
						other.alarm[2] = 60;
						x -= 10;
						break;
					case 2:
						arm_index = 0;
						audio_play_sound(sfx_click, 0, false);
						other.alarm[2] = 30;
						break;
				}
			} else {
				other.stage++;
				other.alarm[2] = 5;
				arm = spr_gideon_tv_arm_move_retract;
			}
			break;
		case 4: // Retracting move arm
			if (arm_index < sprite_get_number(spr_gideon_tv_arm_move_retract) - 1) {
				arm_index++;
				other.alarm[2] = 5;
			} else {
				other.stage++;
				other.alarm[2] = 30;
				arm = spr_gideon_tv_arm_talk_retract;
			}
			break;
		case 5: // Extending talk arm
			if (arm_index > 0) {
				arm_index--;
				other.alarm[2] = 5;
			} else {
				other.stage++;
				other.alarm[2] = 120;
				audio_play_sound(sfx_noise, 0, true);
				arm = spr_gideon_tv_arm_talk;
			}
			break;
		case 6: // end the static
			audio_stop_sound(sfx_noise);
			face = spr_gideon_tv_face_cheery;
			other.stage++;
			other.alarm[2] = 120;
			break;
		case 7: // start the Gideon craze!
			with instance_create_layer(160, 192, layer, obj_textbox) {
				text = [
					"HELLO AMERICA!",
					"IT IS SUCH A GIFT TO BE WITH #Y'ALL TODAY!&SUCH A GIFT!",
					"OH, BUT WE HAVE A WIDDLE #PWOBLEM, DON'T WE?",
					"OLD TIMER, CAN YOU TELL OUR #AUDIENCE WHAT WE'RE DOING HERE #TODAY?",
					"Eh?&That's not what this-",
					"THAT'S RIGHT, FOLKS!",
					"THIS " + (global.player.mabel ? "SWEET PUMPKIN" : "POOR SOUL") + " WAS ABOUT #TO RUN WITHOUT EVEN SAYING #HELLO!",
					"NOW, NOW, " + (global.player.mabel ? "" : "LET'S NOT JUDGE HIM #TOO HARSHLY!&") + "I'M SURE " + (global.player.mabel ? "#S" : "") + "HE MEANT WELL!",
					"BUT I RECKON IT'S HIGH TIME I #SHOWED 'EM A TRUE GRAVITY FALLS #WELCOME!",
					"Y'ALL READY?&HERE WE GO!",
					"...Welp, I done screwed #this up.&Oh well! Good luck!"
				];
				head[4] = spr_mcg_head_uncertain;
				head[10] = spr_mcg_head_happy;
				for (var i = 0; i < array_length(text); i++) {
					sound[i] = (text[i] == string_upper(text[i])) ? tlk_gideon : tlk_mcg;
				}
			}
			audio_play_sound(mus_showtime, 0, true);
			other.stage++;
			break;
	}
}
