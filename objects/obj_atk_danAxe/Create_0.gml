at = (instance_exists(obj_enemy_manDan)) ? obj_enemy_manDan.at : 0;
destroy_on_impact = true;
image_xscale = 2
image_yscale = 2
image_speed = 0;
alarm[0] = 10
direction = point_direction(x,y,obj_soul.x,obj_soul.y)+irandom_range(-5, 5);
if instance_exists(obj_enemy_tyler) if obj_enemy_tyler.attack == 0 direction += irandom_range(-8, 8);
speed = 2