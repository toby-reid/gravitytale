/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4
{
    if (self.timer == 0)
    {
        if (self.sprite_index != spr_enemy_min_unicorn_shaved) self.sprite_index = spr_enemy_min_unicorn_attacking;
        var dir = irandom(359);
        var dist = obj_battleBox.sprite_width / 2;
        with instance_create_layer(
            obj_battleBox.x + lengthdir_x(dist, dir),
            obj_battleBox.y + lengthdir_y(dist, dir),
            layer,
            obj_atk_unicornHeart
        )
        {
            if (instance_number(obj_enemy) > 1)
            {
                heartbeat *= 2;
                alarm[0] = heartbeat;
                if (instance_number(obj_battleAttack) > 1) delay = 2;
            }
        }
    }
    else if (self.timer == 480 or (self.timer == 360 and instance_number(obj_enemy) > 1))
    {
        ++global.stage[0];
    }
    ++self.timer;
}