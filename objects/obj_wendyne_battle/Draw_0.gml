/// @description Death - fix
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {//this is the part to fix - add the other parts
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-sprite_xoffset,y+2*drawy-sprite_yoffset,image_xscale,image_yscale,c_white,image_alpha)
}
else {
	if(y > ystart) vspeed -= .025;
	else if(y < ystart) vspeed += .025;
	draw_sprite_ext(spr_wendyne_btl_legs,0,xstart,ystart,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_waist,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_rarm,0,x+(y-ystart),y+(y-ystart)/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_larm,0,x-(abs(y-ystart)-1.6)*2,y+(abs(y-ystart)-1.6),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(spr_wendyne_btl_torso,0,x,y+(y-ystart),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}