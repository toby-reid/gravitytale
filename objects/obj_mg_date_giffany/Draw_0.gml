switch stage {

	case 1:
		if timer == 0 {audio_group_stop_all(Music); audio_play_sound(mus_mg_date_story,0,true)}
		timer++
		draw_rectangle_color(0,0,319,29,0,0,0,0,false)
		draw_rectangle_color(0,210,319,239,0,0,0,0,false)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_basic_gui)
		if timer < 300 {
			if timer >= 20 and timer < 60 alpha += 1/40
			else if timer >= 260 alpha -= 1/40
			draw_text_transformed_color(161,100,"when the cherry pedals of\nscience romance academy\nare in bloom...",.5,.5,0,c_grey,c_grey,c_grey,c_grey,alpha)
			draw_text_transformed_color(160,100,"when the cherry pedals of\nscience romance academy\nare in bloom...",.5,.5,0,c_yellow,c_yellow,c_yellow,c_yellow,alpha)
		}
		else if timer < 560 {
			if timer >= 320 and timer < 360 alpha += 1/40
			draw_text_transformed_color(161,100,"evtheyring may hadplen",.5,.5,0,c_grey,c_grey,c_grey,c_grey,alpha)
			draw_text_transformed_color(160,100,"evtheyring may hadplen",.5,.5,0,c_yellow,c_yellow,c_yellow,c_yellow,alpha)
		}
		else if timer < 600 {
			if timer == 560 alpha = 0
			alpha += 1/40
			draw_text_transformed_color(161,100,"evtheyring may hadplen",.5,.5,0,c_grey,c_grey,c_grey,c_grey,1)
			draw_text_transformed_color(160,100,"evtheyring may hadplen",.5,.5,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
			draw_set_alpha(alpha)
			draw_rectangle_color(0,0,319,239,0,0,0,0,false)
			draw_set_alpha(1)
			audio_sound_gain(mus_mg_date_story,audio_sound_get_gain(mus_mg_date_story)-1/80,0)
		}
		else {
			stage++
			hithere = false
			layer_set_visible(layer_get_id("Assets_1"),true)
			event_perform(ev_alarm,0)
			draw_rectangle_color(0,0,319,239,0,0,0,0,false)
			layer_background_change(layer_background_get_id("Background"),spr_mg_date_bg)
			layer_background_speed(layer_background_get_id("Background"),sprite_get_speed(spr_mg_date_bg))
			event_user(0)
			audio_stop_sound(mus_mg_date_story)
			audio_sound_gain(mus_mg_date_story,.5,0)
			gain = audio_sound_get_gain(mus_mg_date_mainTheme)
			audio_sound_gain(mus_mg_date_mainTheme,0,0)
			audio_play_sound(mus_mg_date_mainTheme,0,true)
		}
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		break
	case 2:
		var num = string(lovePoints)
		while string_length(num) < 4 num = "0"+num
		for(var i = 1; i <= 4; i++) draw_sprite(spr_mg_date_numbers,real(string_copy(num,i,1))+10,262+6*i,49)
		num = string(charisma)
		if string_length(num) < 2 num = "0"+num
		for(var i = 1; i <= 2; i++) draw_sprite(spr_mg_date_numbers,real(string_copy(num,i,1)),270+5*i,77)
		if hp < 0 {hp = 0; /*go to game over*/}
		num = string(hp)
		while string_length(num) < 3 num = "0"+num
		for(var i = 1; i <= 3; i++) draw_sprite(spr_mg_date_numbers,real(string_copy(num,i,1)),267+5*i,101)
		draw_sprite(spr_mg_date_numbers,lives,278,125)
		num = string(damage)
		if string_length(num) < 2 num = "0"+num
		for(var i = 1; i <= 2; i++) draw_sprite(spr_mg_date_numbers,real(string_copy(num,i,1)),270+5*i,149)
		if damage == 99 {draw_sprite_ext(spr_mg_date_numbers,9,275,149,1,1,0,c_red,1); draw_sprite_ext(spr_mg_date_numbers,9,280,149,1,1,0,c_red,1)}
		if !baggage {
			draw_sprite(spr_mg_date_letters,13,273,172)
			draw_sprite(spr_mg_date_letters,14,280,172)
		}
		else {
			draw_sprite(spr_mg_date_letters,24,270,172)
			draw_sprite(spr_mg_date_letters, 4,277,172)
			draw_sprite(spr_mg_date_letters,18,284,172)
		}
		num = string(day)
		if string_length(num) < 2 num = "0"+num
		for(var i = 1; i <= 2; i++) draw_sprite(spr_mg_date_numbers,real(string_copy(num,i,1))+10,272+6*i,194)
		num = string(hour)
		if string_length(num) < 2 num = "0"+num
		for(var i = 1; i <= 2; i++) draw_sprite(spr_mg_date_numbers,real(string_copy(num,i,1))+10,278+6*i,206)
		
		//31 characters fit in a row
		if charCount > 0 draw_sprite(spr_mg_date_textbox,0,129,26)
		var drawx = 21
		var drawy = 33
		for(var i = 1; i <= string_length(questions[day-1,0]) and i <= charCount; i++) {
			var char = string_copy(questions[day-1,0],i,1)
			if char == "#" {drawx = 21; drawy += 9}
			else if char == " " {drawx += 7}
			else {
				draw_sprite(spr_mg_date_letters,string_pos(char, letters) - 1,drawx,drawy)
				drawx += 7
			}
		}
		drawx = 20
		drawy = 208
		for(var i = 1; i <= string_length(feedback); i++) {
			var char = string_copy(feedback,i,1)
			if char == "#" {drawx = 20; drawy += 10}
			else if char == " " {drawx += 7}
			else {
				draw_sprite(spr_mg_date_letters,scr_letnum(char),drawx,drawy)
				drawx += 7
			}
		}
		draw_self()
		
		if alpha > 0 {
			alpha -= 1/40
			if alpha == 1/40 {
				audio_play_sound(sfx_giffany_hithere,0,false)
				hithere = true
				alarm[3] = 90
			}
			draw_set_alpha(alpha)
			draw_rectangle_color(0,0,319,239,0,0,0,0,false)
			draw_set_alpha(1)
			audio_sound_gain(mus_mg_date_mainTheme,audio_sound_get_gain(mus_mg_date_mainTheme)+gain/40,0)
		}
		break
}