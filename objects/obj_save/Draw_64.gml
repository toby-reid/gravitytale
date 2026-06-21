draw_sprite_ext(spr_savebox,0,320,ybox,size,size,0,c_white,1)
draw_set_font(fnt_basic_gui)
if save > 0 switch save {
	case 1:
	case 2:
		if instance_exists(obj_textbox_old) {if obj_textbox_old.grow < 0 size += .1}
		else {
			draw_text(140,ybox-67,profile.name);
			draw_text(280,ybox-67,string_concat("LV ", profile.lv));
			draw_set_halign(fa_right);
			draw_text(500,ybox-67,profile.play_time);
			draw_set_halign(fa_left);
			draw_text(140,ybox-17,profile.room_name);
			if save == 1 {
				draw_text_color(169,ybox+36,"Save",c_yellow,c_yellow,c_yellow,c_yellow,1)
				draw_text(320,ybox+36,"Return")
				if keyboard_check_pressed(vk_right) {save = 2; audio_play_sound(sfx_beep,0,false)}
				if keyboard_check_pressed(vk_enter) {
					save = 3
					alarm[0] = 15
					scr_save(rmName, music);
                    profile.name = global.player.name;
					profile.lv = global.player.lv;
                    profile.play_time = scr_format_time();
                    profile.room_name = self.rmName;
				}
			}
			else {
				draw_text(169,ybox+36,"Save")
				draw_text_color(320,ybox+36,"Return",c_yellow,c_yellow,c_yellow,c_yellow,1)
				if keyboard_check_pressed(vk_left)  {save = 1; audio_play_sound(sfx_beep,0,false)}
			}
			if keyboard_check_pressed(vk_right) if save == 1 {save = 2; audio_play_sound(sfx_beep,0,false)}
			if keyboard_check_pressed(vk_left) if save == 2 {save = 1; audio_play_sound(sfx_beep,0,false)}
			if (keyboard_check_pressed(vk_enter) and save == 2) or keyboard_check_pressed(vk_shift) save = 3
		}
	break
	case 3:
		if alarm[0] > -1 {
			draw_set_color(c_yellow)
			draw_text(140,ybox-67,profile.name)
			draw_text(280,ybox-67,"LV "+string(profile.lv))
			draw_set_halign(fa_right)
			draw_text(500,ybox-67,string_copy(profile.play_time,1,8))
			draw_set_halign(fa_left)
			draw_text(140,ybox-17,profile.room_name)
			draw_text(169,ybox+36,"Game has been saved!")
			draw_set_color(c_white)
		}
		else {
			size -= .1
			if size <= 0 {
				save = 0
				if !audio_is_playing(music) {
					audio_stop_all()
					audio_play_sound(music,0,true)
				}
				obj_dipper.canMove = true
			}
		}
	break
}