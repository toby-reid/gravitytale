stage = 0
timer = 0
drawx = 0
if global.killed[enemy.blendin] or global.spared[enemy.blendin] instance_destroy()
else if instance_exists(obj_save) obj_save.image_alpha = 0