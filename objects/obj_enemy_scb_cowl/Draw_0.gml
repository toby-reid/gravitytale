/// @description Death
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-sprite_xoffset,y+2*drawy-sprite_yoffset,image_xscale,image_yscale,c_white,image_alpha)
	sprite_index = spr_enemy_scb_cowl_head
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-sprite_xoffset,y+2*drawy-sprite_yoffset,image_xscale,image_yscale,c_white,image_alpha)
	sprite_index = spr_enemy_scb_cowl
}
else {
	draw_self()
	sprite_index = spr_enemy_scb_cowl_head
	if angle_difference(angle,rot) < 0 rot -= 5
	else if angle_difference(angle,rot) > 0 rot += 5
	image_angle = rot
	draw_self()
	sprite_index = spr_enemy_scb_cowl
	image_angle = 0
}