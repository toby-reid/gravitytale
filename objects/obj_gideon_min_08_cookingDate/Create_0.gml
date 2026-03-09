event_inherited();

self.arm = spr_gideon_tv_arm_talk_retract;
self.arm_index = sprite_get_number(self.arm) - 1;

self.stage = 0;
self.drawy = 0;

if (global.player.genocide == RUN.ACTIVE)
{
    instance_destroy();
}
else if (!variable_global_exists("gideon"))
{
    global.gideon = 0;
}
else if (global.gideon >= 8)
{
    instance_destroy();
}
