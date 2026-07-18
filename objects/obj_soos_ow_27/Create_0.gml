image_speed = 0
if (global.soos >= 27 and (global.enemy_killed[ENEMY.SOOS] or global.enemy_spared[ENEMY.SOOS]))
{
    instance_destroy();
    exit;
}
active = false