if (global.gideon >= 3)
{
    instance_destroy();
    exit;
}

event_inherited();
self.face = spr_gideon_tv_static;
self.arm = spr_gideon_tv_armbrella;

self.stage = 0;
