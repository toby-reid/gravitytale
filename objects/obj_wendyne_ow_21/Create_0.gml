stage = 0;
alpha = 0;
image_speed = 0;
index = 0;
drawy = 620;

if (!variable_global_exists("wendy")) global.wendy = 20;
if (global.wendy >= 22 or global.enemy_killed[ENEMY.WENDY]) instance_destroy();
else if (global.wendy == 21) stage = 8;