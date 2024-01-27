if alarm[1] > -1 draw_self()
else if alarm[2] > -1 {
	draw_sprite_part(spr_soul_alts,image_index,0,0,8,16,x-10,y-8)
	draw_sprite_part(spr_soul_alts,image_index,8,0,8,16,x+2,y-8)
}
else {
	draw_sprite_part(spr_soul_alts,image_index,0,0,8,16,xstart-(x-xstart)-10,y-8)
	draw_sprite_part(spr_soul_alts,image_index,8,0,8,16,x+2,y-8)
	vspeed += .25
}