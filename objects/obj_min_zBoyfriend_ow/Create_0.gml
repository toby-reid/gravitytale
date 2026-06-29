if (global.enemy_killed[ENEMY.ZOMBIE_BOYFRIEND] || global.enemy_spared[ENEMY.ZOMBIE_BOYFRIEND])
{
    instance_destroy();
    exit;
}
event_inherited();
goto = btl_min_zBoyfriend;
prevMusic = mus_medium;
