/// @description Death
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	deathx += 4
	sprite_index = spr_enemy_scb_beaverChainsaw
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x-134+(deathx*(2*(drawy%2-.5))),y-102+2*drawy,2,2,c_white,image_alpha)
}
else {
	draw_sprite_part_ext(spr_enemy_scb_chainsawBeaver,0,0,50,69,47,x-68,y+4,2,2,image_blend,image_alpha)
	draw_sprite_part_ext(spr_enemy_scb_chainsawBeaver,0,0,0,69,39,x-68,y-96+4*index,2,2,image_blend,image_alpha)
	draw_self()
	draw_sprite_part_ext(spr_enemy_scb_chainsawBeaver,0,21,36,21,16,x-24,y-70+4*index,2,2,image_blend,image_alpha)
}