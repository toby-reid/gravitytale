at = obj_soos_battle.at
image_angle = point_direction(x,y,obj_soul.x,obj_soul.y)
direction = image_angle
alarm[0] = 180
if x >= 320 {image_xscale = -1; image_angle -= 180}