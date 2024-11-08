if (hp > 0 or (!audio_is_playing(sfx_enemyDead) and deathx == 0)) {
	draw_sprite_ext(spr_ford_battle_body,0,x+2,y+22,2,2,0,image_blend,image_alpha)
}