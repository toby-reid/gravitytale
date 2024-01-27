at = obj_enemy_manDan.at
image_xscale = 2
image_yscale = 2
alarm[0] = 10
direction = point_direction(x,y,obj_soul.x,obj_soul.y)+irandom(10)-5
if instance_exists(obj_enemy_tyler) if obj_enemy_tyler.attack == 0 direction += irandom(16)-8
speed = 2