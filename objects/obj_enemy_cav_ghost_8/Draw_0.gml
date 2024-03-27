draw_self()
if timer >= 180 if timer < 240 {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale+drawx,image_yscale+drawx,image_angle,image_blend,.5-drawx/3)
	drawx += .025
}