blackout_alpha = 1;
stage = 0;
my_collision = noone;

if (global.enemy_killed[ENEMY.PACIFICA] || global.enemy_spared[ENEMY.PACIFICA])
{
    instance_destroy();
    exit;
}
