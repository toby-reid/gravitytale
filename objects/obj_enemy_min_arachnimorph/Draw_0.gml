/// @description Death & Transition

// Inherit the parent event
event_inherited();
if (self.is_spider and self.sprite_index == spr_enemy_min_arach_human and self.hp > 0 and !instance_exists(obj_battleTarget))
{
    if (self.image_alpha == 1) audio_play_sound(sfx_enemyDead, 0, false);
    draw_sprite_ext(spr_enemy_min_arach_spider, self.image_index, self.x, self.y, self.image_xscale, self.image_yscale, self.image_angle, self.image_blend, 1 - self.image_alpha);
    self.image_alpha -= 0.05;
    if (self.image_alpha == 0)
    {
        self.image_alpha = 1;
        self.sprite_index = spr_enemy_min_arach_spider;
    }
}
