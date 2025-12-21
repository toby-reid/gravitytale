draw_set_font(fnt_basic_gui)
if image_index == 0 {//new game
	if size >= 1 {
		draw_text_transformed_color(56+string_width("* "),325,global.player.name,size,size,0,c_aqua,c_aqua,c_aqua,c_aqua,1)
		size += .01
	}
	else if instance_exists(obj_textbox) with obj_textbox {
		if page == 4 and choice[7] == 1 {
			global.player.mabel = bool(action[4]);
		}
		else if (choice[7] == 1 and page == 6) or (choice[7] == 0 and page == 3) {
			keyboard_unset_map()
			if charCount >= 32 with other {
				obj_textbox.charCount = 32
				if keyboard_check_pressed(vk_enter) { if string_length(name) >= 1 with obj_textbox {
					alarm[2] = 1
					response = ["",tlk_title,fnt_basic_gui,0/*style*/,1/*choice[4] and choice[7]*/]
					switch string_lower(other.name) {
						case "":
							response[0] = "Hmm, that doesn't look like a name. Try again."
							response[4] = 0
							break
						case "dipper":
							response[0] = "WARNING!&This will do absolutely nothing.";
							break;
					}
					var col = global.player.mabel ? "@CC277A" : "@1970ff";
					text[page+1] = col + other.name + text[page+1]
					scr_setmap()
					audio_play_sound(sfx_select,0,0)
				}}
				else {
					name += keyboard_string
					if keyboard_check_pressed(vk_backspace) name = string_copy(name,1,string_length(name)-1)
					if string_length(name) > 6 name = string_copy(name,1,6)
					keyboard_string = ""
				}
				var color = global.player.mabel ? scr_hexdec("CC277A") : scr_hexdec("1970FF");
				draw_text_color(56+string_width("* "),395,name+"_",color,color,color,color,1)
			}
			else keyboard_string = ""
		}
		else if (choice[7] == 1 and page == 7) or (choice[7] == 0 and page == 4) {
			if charCount >= 28 charCount = 55
		}
	}
	else {
		draw_set_halign(fa_center)
		draw_text_color(320,360,"(Z) Begin Game",c_yellow,c_yellow,c_yellow,c_yellow,1)
		draw_set_halign(fa_left)
	}
}
// TODO: Add checks & logic for drawing save data (as retrieved in Create)
