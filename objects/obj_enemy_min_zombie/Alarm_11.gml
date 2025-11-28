/// @description Idle animation

switch self.sprite_index
{
    case spr_enemy_min_zombie:
        self.image_index = 0;
        self.sprite_index = spr_enemy_min_zombie_dropEye;
        self.alarm[event_number] = 6;
        break;
    case spr_enemy_min_zombie_dropEye:
        ++self.image_index;
        if (self.image_index == self.image_number - 1)
        {
            self.image_index = 0;
            self.sprite_index = spr_enemy_min_zombie_swingEye;
            self.alarm[event_number] = irandom_range(20, 80);
        }
        else self.alarm[event_number] = 6;
        break;
    case spr_enemy_min_zombie_swingEye:
        self.image_index = (self.image_index + 1) mod self.image_number;
        if (self.image_index == self.image_number - 1 and irandom(4) == 0)
        {
            self.image_index = 0;
            self.sprite_index = spr_enemy_min_zombie_restoreEye;
            self.alarm[event_number] = 6;
        }
        else self.alarm[event_number] = 20;
        break;
    case spr_enemy_min_zombie_restoreEye:
        ++self.image_index;
        if (self.image_index == self.image_number - 1)
        {
            self.image_index = 0;
            self.sprite_index = spr_enemy_min_zombie;
            self.alarm[event_number] = irandom_range(60, 600);
        }
        else self.alarm[event_number] = 6;
        break;
}
