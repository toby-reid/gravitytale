stage = 0;
image_speed = 0;
if(!variable_global_exists("wendy")) global.wendy = 22;
else if(global.wendy >= 23 or global.enemy_killed[ENEMY.WENDY]) instance_destroy();