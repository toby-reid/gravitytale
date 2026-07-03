/// @description Attack
if image_alpha == 1
{
    if !instance_exists(obj_textBubble) if global.stage[0] == 4
    {
        if (self.timer == 0)
        {
            if (not self.is_spider and (global.stage[1] != 1 or global.enemy[global.stage[2]] != self.id or global.stage[5] == 0))
            {
                // We have been ignored this round
                if (self.acts_to_spare > 0)
                {
                    --self.acts_to_spare;
                    if (self.acts_to_spare == 0)
                    {
                        self.spare = true;
                        obj_battleCore.text[0] = "This average Joe grows tired of #your sense of stranger danger.&You make poor prey.";
                    }
                }
            }
            if (not audio_is_playing(sfx_spiderString)) audio_play_sound(sfx_spiderString, 0, false);
            for (var i = 0; i < 2; ++i)
            {
                instance_create_layer(obj_battleBox.x + irandom_range(-70, 70), obj_battleBox.y + irandom_range(-50, 50), layer, obj_atk_spiderweb);
            }
        }
        else if (self.timer == 420
                 or (self.timer == 180 and !self.is_spider and instance_number(obj_battleEnemy) == 1)
                 or (self.timer == 300 and instance_number(obj_battleEnemy) > 1))
        {
            ++global.stage[0];
        }
        else if (self.is_spider and self.timer mod ((instance_number(obj_battleEnemy) > 1) ? 60 : 30) == 0)
        {
            var bbox_dir = irandom(3);
            var spider_x = (bbox_dir mod 2 == 0) ? (400 - (80 * bbox_dir)) : irandom_range(240, 400);
            var spider_y = (bbox_dir mod 2 == 0) ? irandom_range(252, 386) : (185 + (67 * bbox_dir));
            with instance_create_layer(spider_x, spider_y, layer, obj_battleAttack)
            {
                at = other.at;
                direction = point_direction(spider_x, spider_y, obj_soul.x, obj_soul.y) + irandom_range(-5, 5);
                speed = 2;
                sprite_index = spr_atk_spider;
                destroy_on_impact = true;
            }
        }
        ++self.timer;
    }
}
else if (not self.is_spider and self.hp > 0 and global.stage[1] == 0 and global.enemy[global.stage[2]] == self.id and global.stage[4] > 0)
{
    // We were just hit
    event_user(0);
}
