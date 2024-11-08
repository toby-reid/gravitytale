/// @description Death
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-(2*sprite_xoffset),y+2*drawy-(2*sprite_yoffset),2,2,c_white,image_alpha)
	sprite_index = spr_ford_battle_body
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-(2*sprite_xoffset),y+22+2*drawy-(2*sprite_yoffset),2,2,c_white,image_alpha)
	sprite_index = spr_ford_head_battle_neutral
}
else {
	draw_self()
}