at = obj_enemy_deputy.at
image_xscale = 2
image_yscale = 2
alarm[0] = 20
if x < 320 hspeed = 1
else hspeed = -1
if global.enemy_killed[ENEMY.SHERIFF] hspeed *= 2