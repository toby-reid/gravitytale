/// @description Death/Animation
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
	deathx += 4
	for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,0,0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-36,y+2*drawy-146,2,2,c_white,image_alpha)
}
else {
	draw_self()
	draw_sprite_ext(sprite_index,2,x,y+4+lengthdir_y(4,arm),2,2,0,c_white,image_alpha)
	draw_sprite_part_ext(sprite_index,3,0,0,sprite_width/4,sprite_height,x-38-lengthdir_x(2,arm),y-144+lengthdir_y(4,arm),2,2,c_white,image_alpha)
	draw_sprite_part_ext(sprite_index,3,sprite_width/4,0,sprite_width/4,sprite_height,x+3+lengthdir_x(2,arm),y-144+lengthdir_y(4,arm),2,2,c_white,image_alpha)
	draw_sprite_ext(sprite_index,4+global.enemy_killed[ENEMY.SHERIFF],x,y+8+lengthdir_y(8,arm),2,2,0,c_white,image_alpha)
	if !global.enemy_killed[ENEMY.SHERIFF] arm += 5
	arm += 5
	if arm >= 360 arm -= 360
}