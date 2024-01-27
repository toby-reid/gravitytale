draw_self()
if keyboard_check_released(ord("Z")) or mouse_check_button_released(mb_left) active = false
if place_meeting(x,y,obj_mg_date_cursor) {
	if keyboard_check_pressed(ord("Z")) or mouse_check_button_pressed(mb_left) active = true
	draw_set_alpha(.25)
	if active var color = c_black
	else var color = c_white
	draw_rectangle_color(x-36,y+4,x+35,y+31,color,color,color,color,false)
	draw_set_alpha(1)
}
draw_set_font(fnt_basic_gui)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if image_blend == c_white var color = 0xE6E6E6
else var color = image_blend
draw_text_ext_transformed_color(x+1,y+16,text,20,200,.35,.35,0,0x53435c*(image_blend==c_white),0x53435c*(image_blend==c_white),0x53435c*(image_blend==c_white),0x53435c*(image_blend==c_white),1)
draw_text_ext_transformed_color(x,y+16,text,20,200,.35,.35,0,color,color,color,color,1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
if image_blend == c_red draw_sprite(spr_mg_date_heart,1,x-53,y+18)
else if image_blend == c_yellow draw_sprite(spr_mg_date_heart,0,x-53,y+18)