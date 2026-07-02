/// @description Death
if (hp <= 0 and (audio_is_playing(sfx_enemyDead) or deathx != 0))
{
    deathx += 4;
    for (var _drawy = 0; _drawy < sprite_height; _drawy++)
    {
        draw_sprite_part_ext(spr_paz_battle_damage, 0, 0, _drawy, sprite_width, 1, x + (deathx * (2 * ((drawy % 2) - 0.5))) - sprite_xoffset, y + (2 * _drawy) - sprite_yoffset, image_xscale, image_yscale, c_white, image_alpha);
    }
}
else if (audio_is_playing(sfx_damageDealt))
{
    draw_sprite_ext(spr_paz_battle_damage, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    // teacup
    draw_sprite_ext(spr_paz_battle_teacup, 0, x - sprite_xoffset + 170, y - sprite_yoffset + 76 + arms_yoffset, image_xscale, image_yscale, 8 * arms_yoffset, image_blend, image_alpha);
    // club
    draw_sprite_ext(spr_paz_battle_club, 0, x - sprite_xoffset + 52, y - sprite_xoffset + 80 + arms_yoffset, image_xscale, image_yscale, -arms_yoffset, image_blend, image_alpha);
    // head
    draw_sprite_ext(sprite_index, 1, x, y + (2 * torso_yoffset), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    // feet
    draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    // torso
    draw_sprite_ext(sprite_index, 3, x, y + torso_yoffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    // arms
    draw_sprite_ext(sprite_index, 4, x, y + arms_yoffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
