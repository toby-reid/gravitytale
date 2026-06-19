event_inherited();
self.face = spr_gideon_tv_static;
self.arm = spr_gideon_tv_arm_talk_retract;
self.arm_index = sprite_get_number(self.arm) - 1;
self.y_offset = 30;
self.drawy = sprite_height - y_offset;
self.stage = 0;
self.emerge_speed = 12;
self.showing_doll = false;
self.flaming_doll = false;
self.flame_index = 0;
self.flame_speed = ceil(sprite_get_speed(spr_flame_small) / ((sprite_get_speed_type(spr_flame_small) == spritespeed_framespersecond) ? gamespeed_fps : 1));

if (!variable_global_exists("gideon"))
{
    global.gideon = 0;
}
else if (global.gideon >= 13)
{
    instance_destroy();
}
