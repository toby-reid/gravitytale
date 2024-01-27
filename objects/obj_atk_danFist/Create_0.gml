at = obj_enemy_manDan.at
image_xscale = 2
image_yscale = 2
num = irandom(13)
if instance_exists(obj_enemy_tyler) if obj_enemy_tyler.attack == 0 while num == 1 or num == 8 num = irandom(13)
if num < 3 {x = 140; y = 280+40*num; draw = [x+105,y-20,x+255,y+20]}
else if num < 7 {x = 260+40*(num-3); y = 480; image_angle = 90; draw = [x-20,y-220,x+20,y-100]}
else if num < 10 {x = 500; y = 360-40*(num-7); image_xscale = -2; draw = [x-255,y-20,x-105,y+20]}
else {x = 380-40*(num-10); y = 160; image_angle = 270; draw = [x-20,y+100,x+20,y+220]}
direction = image_angle
if image_xscale == -2 direction = 180
alarm[0] = 5
flashes = 0