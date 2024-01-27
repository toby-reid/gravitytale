draw_self()
if stage == 10 if timer >= 30 if timer < 90 {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale+drawx,image_yscale+drawx,image_angle,image_blend,.5-drawx/3)
	drawx += .025
}