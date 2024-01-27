draw_self()
if image_index%2 == 0 {
	draw_sprite_part(spr_wendy_axe_ow_create,index,0,0,2,sprite_height,x,y+33)
	draw_sprite_part(spr_wendy_axe_ow_create,index,6,0,sprite_width-6,sprite_height,x+6,y+33)
}
else draw_sprite_part(spr_wendy_axe_ow_create,index,5,0,sprite_width-5,sprite_height,x+10,y+31)