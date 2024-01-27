if image_index == 2 {
	if global.stage[0] < 3 with obj_soul draw_sprite(spr_ghost_5,0,x+10,y)
	else if global.stage[0] == 4 obj_soul.image_alpha = 0
}
draw_self()