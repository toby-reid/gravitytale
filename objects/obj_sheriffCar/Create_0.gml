stage = 0
image_speed = 0
if global.enemy_spared[ENEMY.SHERIFF] or global.enemy_spared[ENEMY.DEPUTY] instance_destroy()//If we've done the battle and one or both was spared
else if global.enemy_killed[ENEMY.SHERIFF] stage = 5//If they're both dead