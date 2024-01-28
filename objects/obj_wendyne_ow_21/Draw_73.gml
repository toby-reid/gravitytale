/// @description The Nachos tricked me
if(stage == 7) {
	draw_sprite_general(spr_wendy_axe_ow,0,4,0,16,8,x-9,y-12,1,1,-45,c_white,c_white,c_white,c_white,1);
	draw_sprite(spr_nettrap,index,obj_dipper.x,drawy);
	if(index < 9) index += .25;
	else if(drawy > 540) drawy -= 2;
	obj_dipper.y = drawy;
}