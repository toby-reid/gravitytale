/// @description Death
if hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0) {
    image_yscale = 2
    deathx += 4
    for(var drawy = 0; drawy < sprite_height; drawy++) draw_sprite_part_ext(sprite_index,image_index - (image_index mod 2),0,drawy,sprite_width,1,x+(deathx*(2*(drawy%2-.5)))-48,y+2*drawy-40,2,2,c_white,image_alpha)
}
else draw_self()