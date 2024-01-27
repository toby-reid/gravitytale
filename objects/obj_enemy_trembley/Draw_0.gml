/// @description Death
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	vspeed = 0
	hspeed = 0
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-sprite_xoffset,y+2*drawy-sprite_yoffset,image_xscale,image_yscale,c_white,image_alpha)
}
else {
	draw_sprite_ext(sprite_index,4,x,y,image_xscale,image_yscale,-1*image_angle/2,image_blend,image_alpha)
	draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,image_angle/2,image_blend,image_alpha)
	draw_sprite_ext(sprite_index,2,x,y,image_xscale,image_yscale,0,image_blend,image_alpha)
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	image_angle += angle
	vspeed += diry
	if vspeed >= 9 diry = -1.5
	else if vspeed <= -9 diry = 1.5
	hspeed += dirx
	if hspeed >= 12 dirx = -.5
	else if hspeed <= -12 dirx = .5
}