stage = 0
timer = 0
drawx = 0
if global.enemy_killed[ENEMY.BLENDIN] or global.enemy_spared[ENEMY.BLENDIN] instance_destroy()
else if instance_exists(obj_save) obj_save.image_alpha = 0