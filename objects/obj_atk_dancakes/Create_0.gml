at = obj_enemy_manDan.at
image_xscale = 2
image_yscale = 2
vspeed = -2
hspeed = random(2)-1
if instance_exists(obj_enemy_tyler) if obj_enemy_tyler.attack == 0 while round(hspeed) == 0 hspeed = irandom(2)-1
image_angle = irandom(30)-15