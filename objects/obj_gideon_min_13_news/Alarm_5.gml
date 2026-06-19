/// @desc flame speed
++self.flame_index;
if (self.flame_index >= sprite_get_number(spr_flame_small))
{
    self.flame_index = 0;
}
self.alarm[5] = self.flame_speed;
