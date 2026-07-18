if (global.player.genocide == RUN.ACTIVE || global.gideon >= 8)
{
    instance_destroy();
    exit;
}

event_inherited();

self.arm = spr_gideon_tv_arm_talk_retract;
self.arm_index = sprite_get_number(self.arm) - 1;

self.stage = 0;
self.drawy = 0;

task_success = false;
