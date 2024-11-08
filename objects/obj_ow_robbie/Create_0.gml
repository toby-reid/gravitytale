stage = 0
if global.enemy_spared[ENEMY.ROBBIE] or global.enemy_killed[ENEMY.ROBBIE] instance_destroy()
else obj_save.image_alpha = 0