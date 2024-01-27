draw_self()
if grow != 0 {
	image_xscale += grow
	image_yscale += grow
	if image_xscale == 1 grow = 0
	if image_xscale == 0 instance_destroy()
}
else {
	charCount += charRate[page]
	draw_set_font(font[page])
	if style[page] >= 4 {drawShift[0]--; if drawShift[0] == 0 drawShift[0] = 32}
	for(var i = segment; i >= 0; i--) {
		if style[page] == 2 or style[page] == 3 or style[page] >= 6 draw_set_font(fnt_basic_bubble)
		var drawx = x+28
		var drawy = y-28
		var w = 65
		w += 45*image_index
		if style[page] == 0 draw_text_ext_color(x+28,y-28,string_copy(segText[i],1,charCount),12,w,segColor[i],segColor[i],segColor[i],segColor[i],1)
		else for(var j = 1; j <= charCount and j <= string_length(segText[i]); j++) {
			if i == segment {//once per cycle
				if style[page]%2 == 1 {//shaking
					if timer[j] == 0 {
						drawAng[j] = irandom(10)-5
						timer[j] = 5
					}
					timer[j]--
				}
				if style[page] >= 4 {//waving
					if ceil((j+drawShift[0])/16)%2 == 0 drawShift[j] += .2
					else drawShift[j] -= .2
				}
			}
			var char = string_copy(segText[i],j,1)
			if char == "#" or char == "&" {
				drawx = x+28
				drawy += 12
			}
			else {
				if style[page] == 2 or style[page] == 3 or style[page] >= 6 if j >= charCount-(charRate[page]*15) draw_set_font(font[page])
				draw_text_transformed_color(drawx,drawy+drawShift[j],string_copy(segText[i],j,1),1,1,drawAng[j],segColor[i],segColor[i],segColor[i],segColor[i],1)
				drawx += string_width(string_copy(segText[i],j,1))
			}
		}
	}
	if keyboard_check_pressed(vk_shift) charCount = string_length(segText[segment])+20
	if charCount >= string_length(segText[segment]) {
		if segment < array_length(segText)-1 segment++
		else {
			//draw "continue" sprite
			if keyboard_check_pressed(vk_enter) if !instance_exists(obj_battleButtons_yn) alarm[0] = 1
		}
	}
}