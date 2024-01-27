at = obj_enemy_cav_fairy.at
//image_index = obj_enemy_cav_fairy.image_index set by caller
image_xscale = 2
image_yscale = 2
dest = [200+240*irandom(1),346+2*irandom(46)]
direction = point_direction(x,y,dest[0],dest[1])
speed = point_distance(x,y,dest[0],dest[1])/120
alarm[0] = 120
//220 or 420, 346:440