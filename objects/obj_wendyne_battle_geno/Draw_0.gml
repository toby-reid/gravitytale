/// @description Death & Anim
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-sprite_xoffset,y+2*drawy-sprite_yoffset,image_xscale,image_yscale,c_white,image_alpha)
}
else if(sprite_index == spr_wendyne_btl_legs) {
	if(y > ystart) vspeed -= .025;
	else if(y < ystart) vspeed += .025;
	draw_sprite_ext(spr_wendyne_btl_legs,0,xstart,ystart,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_waist,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_rarm,0,x+(y-ystart),y+(y-ystart)/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_larm,0,x-(abs(y-ystart)-1.6)*2,y+(abs(y-ystart)-1.6),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_torso,0,x,y+(y-ystart),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	//draw_sprite_ext(head,0,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);
	if(instance_exists(obj_battleBox)) if(obj_battleBox.y == 240) {
		draw_set_alpha(.75);
		draw_rectangle_color(0,0,639,479,c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
		with(obj_battleBox) draw_self();
		with(obj_soul) draw_self();
		with(obj_soul_3_shield) draw_self();
	}
}
else if(sprite_index == spr_wendyne_geno_legs) {
	draw_self();
}
else {
	draw_self();
	//if(head != noone) draw_sprite_ext(head,0,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);
}