stage = 0
image_speed = 0
if global.spared[enemy.sheriff] or global.spared[enemy.deputy] instance_destroy()//If we've done the battle and one or both was spared
else if global.killed[enemy.sheriff] stage = 5//If they're both dead