/// @description Start moving
image_angle = irandom(29)*12
if x > 320 image_xscale = 2
hspeed = lengthdir_x(3/instance_number(obj_enemy),image_angle)
vspeed = lengthdir_y(3/instance_number(obj_enemy),image_angle)
image_speed = 1