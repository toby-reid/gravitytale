event_inherited();
self.face = spr_gideon_tv_static;
self.arm = spr_gideon_tv_armbrella;

self.stage = 0;

if (!variable_global_exists("gideon"))
{
    global.gideon = 0;
}
else if (global.gideon >= 3)
{
    instance_destroy();
}
