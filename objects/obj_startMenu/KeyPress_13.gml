switch image_index {
	case 0://Starting new game
		if !instance_exists(obj_textbox_old) { if size == 0 {
			scr_new_global_player()
			with instance_create_layer(320,376,layer,obj_textbox_old) {
				if !file_exists(global.SAVE_FILES.PERS_RESET.NAME) {
					text = [
						"Greetings, Child!#`(...or adult)",
						"Welcome to the world of #GRAVITYTALE.",
						". . .",
						"I seem to have misplaced #my new glasses.",
						"Are you a boy?&or are you a girl?#       boy         girl",
						"Ah, yes...&It's all so clear now...",
						"Now, then...&What is your @ffff00name@ffffff?&  ",
						"&@ffffffIs this name correct?     #       yes         no"
					]
					choice[7] = 1
					action[4] = irandom(1)
				} else {
					text = [
						"Greetings, Child!",
						"Welcome back to the world of #GRAVITYTALE.",
						"I recently got new contact #lenses, so I can see that you #are clearly a ",
						"Now, then...&What is your @ffff00name@ffffff?&  ",
						"&@ffffffIs this name correct?     #       yes         no"
					]
					text[2] += global.player.mabel ? "@CC277Agirl@ffffff." : "@3280ffboy@ffffff.";
					choice[7] = 0
				}
				for(var i = 0; i < array_length(text); i++) {
					sound[i] = tlk_title
					charRate[i] = 4
				}
				choice[4] = 1
			}
			name = ""
		}}
		else with obj_textbox_old if charCount >= string_length(segText[array_length(segText)-1]) {
			if ((choice[7] == 1 and page == 7) or (choice[7] == 0 and page == 4)) {
				if choice[4] == 1 and action[page] == 0 {//valid, yes name
					other.size = 1
					global.player.name = other.name
					with instance_create_layer(0,0,layer,obj_fadeWhite) goto = ow_scb_0_meetBill
				} else {//invalid or 'no' to name
					page -= 2
					alarm[2] = 1
					var index = 4;
					if (!file_exists(global.SAVE_FILES.PERS_RESET.NAME))
                    {
                        index = 7;
						choice[index] = 1;
					}
					text[index] = "&@ffffffIs this name correct?     #       yes         no"
					other.name = ""
				}
			}
		}
		break
	//shouldn't need a case 1
	case 2:
		if(!instance_exists(obj_textbox_old))
			if !scr_load()
				with instance_create_layer(160,192,"Instances",obj_textbox_old) text = ["@ff0000Whoops!@ffffff&Looks like you've got an old #save loaded!","Contact the Creator if you #believe this is a mistake."];
		break
	case 3: image_index = 5; audio_play_sound(sfx_select,0,false) break
	case 4:
		scr_reset(false);
		audio_play_sound(sfx_select, 0, false);
		room_restart();
		break
	case 5: image_index = 3; audio_play_sound(sfx_beep,0,false) break
}