draw_sprite_part_ext(sprite_index,image_index,0,0,sprite_width,drawy,x-sprite_xoffset,y-sprite_yoffset,image_xscale,image_yscale,image_blend,image_alpha)
if global.stage[0] == 4 if obj_soul.active {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_basic_gui)
	draw_set_alpha(.7)
	var remTime = maxTime[stage] - timer
	draw_text(320,240,ceil(remTime/60))
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_alpha(1)
}