/// @description draw_self()

if !instance_exists(obj_textBubble) {//roll, stop, etc.
	switch stage {
		case 1:
			image_angle -= 8
		case 0:
			vspeed += .1
			hspeed = 1
			if y >= 220 {
				y = 220
				vspeed *= -.5
				audio_play_sound(sfx_click,0,false)
				stage++
			}
			break
		case 2:
			image_angle -= 4
			vspeed += .1
			if y >= 220 {
				y = 220
				vspeed = 0
				hspeed = 0
				audio_play_sound(sfx_click,0,false)
				stage++
			}
			break
		case 3:
			if image_angle mod 90 != 0 {
				x++
				image_angle -= 2
			}
			else if alarm[1] == -1 alarm[1] = 45
			break
	}
}
draw_self()
if (image_index>=0 and image_index<2) or (image_index>=6 and image_index<8) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_bill_gui)
	if hspeed == 0 and stage < 3 draw_text_transformed(x+2,y+1,string_copy(secret,char,1),1,1,image_angle)
	else if stage == 4 draw_text(x+2,y-1,"1")
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}