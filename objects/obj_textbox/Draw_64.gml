draw_self()
if grow != 0 {
	image_xscale += grow
	image_yscale += grow
	if image_xscale >= 2 {grow = 0; image_xscale = 2; image_yscale = 2}
	if image_xscale < .2 instance_destroy()
}
else {
	draw_set_font(font[page])
	if(style[page] >= 4) {drawShift[0]--; if(drawShift[0] == 0) drawShift[0] = 64}
	for(var i = segment; i >= 0; i--) {
		if(style[page] == 2 or style[page] == 3 or style[page] >= 6) draw_set_font(fnt_basic_gui)
		var drawx = x-264
		var drawy = y-51
		if(head[page] != noone) {//Head/dialogue
			drawx += 104
			draw_sprite_ext(head[page],face,x-224,y,2,2,0,c_white,1)
		}
		if(font[page] != fnt_papyrus_gui) {//Starting asterisk
			draw_text(drawx+(style[page]%2==1)*(irandom(2)-1),drawy+(style[page]%2==1)*(irandom(2)-1),"*")
			drawx += string_width("* ")
		}
		for(var j = 1; j <= floor(charCount) and j <= string_length(segText[i]); j++) {
			if(i == segment) {//only run at the beginning of each cycle
				/*if(style[page]%2 == 1) {//shake
					if(timer[j] == 0) {
						drawAng[j] = irandom(10)-5
						timer[j] = 6
					}
					timer[j]--
				}*/
				if(style[page] >= 4) {//wave
					if(ceil((j+drawShift[0])/32)%2 == 0) drawShift[j] += .25
					else drawShift[j] -= .25
				}
				if(style[page] == 2 or style[page] == 3 or style[page] >= 6) {//fontswap
					if(swapTime[j] < 15) swapTime[j]++
				}
			}
			var char = string_copy(segText[i],j,1)
			if char == "&" {
				drawx = x-264
				if(head[page] != noone) drawx += 104
				drawy += 35
				if font[page] != fnt_papyrus_gui {
					draw_text(drawx+(style[page]%2==1)*(irandom(2)-1),drawy+(style[page]%2==1)*(irandom(2)-1),"*")
					drawx += string_width("* ")
				}
			}
			else if char == "#" {
				drawx = x-264
				if(font[page] != fnt_papyrus_gui) drawx += string_width("* ")
				if(head[page] != noone) drawx += 104
				drawy += 35
			}
			else if char != "`" {
				if(style[page] == 2 or style[page] == 3 or style[page] >= 6)
					if(swapTime[j] < 15) draw_set_font(font[page])
				draw_text_color(drawx+(style[page]%2==1)*(irandom(2)-1),drawy+(style[page]%2==1)*(irandom(2)-1)+drawShift[j],char,segColor[i],segColor[i],segColor[i],segColor[i],1)
				drawx += string_width(char)
			}
		}
	}
	if charCount >= string_length(segText[segment]) {
		if(segment < array_length(segText)-1) segment++
		else {
			if(choice[page] > 0) {
				if global.player[player.mabel] var color = scr_hexdec("CC277A")
				else var color = scr_hexdec("3280ff")
			}
			else var color = c_white
			if(page < array_length(text)-1 and color == c_white) draw_sprite_ext(spr_moreText,arrow,x+270,y+50,3,3,0,color,1)
			else draw_sprite_ext(spr_moreText,arrow,x+270,y+50,3,3,90,color,1)
			face = 0
			if keyboard_check_pressed(vk_enter) alarm[2] = 1
		}
		if(choice[page] > 0) {
			if global.player[player.mabel] var i = spr_soulM
			else var i = spr_soul
			switch action[page] {
				case 0://left
					draw_sprite(i,0,x-132-6*(head[page]!=noone),y-2+35*(choice[page]<3))
					break
				case 1://right
					draw_sprite(i,0,x+60+6*(head[page]!=noone),y-2+35*(choice[page]<3))
					break
				case 2://up
					draw_sprite(i,0,x-20,y-2-35)
					break
				case 3://down
					draw_sprite(i,0,x-20,y-2+35)
					break
			}
		}
	}
	else if(alarm[0] == -1) alarm[0] = charRate[page]
	if keyboard_check_pressed(vk_shift) {
		segment = array_length(segText)-1
		charCount = string_length(segText[segment])+15
		for(var i = 0; i < array_length(swapTime); i++) swapTime[i] = 15
	}
	if keyboard_check_pressed(vk_left)  action[page] = 0
	if keyboard_check_pressed(vk_right) action[page] = 1
	if keyboard_check_pressed(vk_up)   if(choice[page] > 1) action[page] = 2
	if keyboard_check_pressed(vk_down) if(choice[page] > 2) action[page] = 3
}