///@desc Shave / Death
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-66,y+2*drawy-58,2,2,c_white,image_alpha)
}
else if stage != 2 draw_self()
else {
	draw_sprite_ext(spr_enemy_fst_bCub_shaved,image_index,x,y,2,2,0,c_white,1)
	draw_sprite_part_ext(spr_enemy_fst_bCub,image_index,33,0,sprite_width,sprite_height,x,y-58,2,2,c_white,1)
}