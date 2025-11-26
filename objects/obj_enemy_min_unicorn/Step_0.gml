/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4
{
    if (self.timer == 0)
    {
        if (self.sprite_index != spr_enemy_min_unicorn_shaved) self.sprite_index = spr_enemy_min_unicorn_attacking;
        with instance_create_layer(
            obj_battleBox.x + irandom(obj_battleBox.sprite_width) - (obj_battleBox.sprite_width / 2),
            obj_battleBox.y + irandom(obj_battleBox.sprite_height) - (obj_battleBox.sprite_height / 2),
            layer,
            obj_atk_unicornHeart
        )
        {
            if (instance_number(obj_battleEnemy) > 1)
            {
                heartbeat *= 2;
                alarm[0] = heartbeat;
                if (instance_number(obj_battleAttack) > 1) delay = 2;
            }
            var attempts = 0;
            while (attempts < 5 and instance_place(x, y, [obj_atk_unicornHeart, obj_soul]) != noone)
            {
                x = obj_battleBox.x + irandom(obj_battleBox.sprite_width) - (obj_battleBox.sprite_width / 2);
                y = obj_battleBox.y + irandom(obj_battleBox.sprite_height) - (obj_battleBox.sprite_height / 2);
                ++attempts;
            }
        }
    }
    else if (self.timer == 480 or (self.timer == 360 and instance_number(obj_battleEnemy) > 1))
    {
        ++global.stage[0];
    }
    ++self.timer;
}