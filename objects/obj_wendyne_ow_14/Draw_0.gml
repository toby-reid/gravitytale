draw_sprite_part_ext(sprite_index,image_index,0,0,21,49,x,y,image_xscale,image_yscale,image_blend,image_alpha)
if image_index%2 == 0 {
	draw_sprite_part(spr_wendy_axe_ow_create,index,0,0,2,sprite_height,x,y+33)
	draw_sprite_part(spr_wendy_axe_ow_create,index,6,0,sprite_width-6,sprite_height,x+6,y+33)
}
else draw_sprite_part(spr_wendy_axe_ow_create,index,5,0,sprite_width-5,sprite_height,x+10,y+31)

draw_set_alpha(alpha)
draw_rectangle_color(640,100,659,119,c_black,c_black,c_black,c_black,false)
draw_rectangle_color(660,100,899,159,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)