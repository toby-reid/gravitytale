alarm[0] = 20
stage = 0
tries = 0
image_speed = 0
if global.soos >= 5 instance_destroy()
else if global.soos > 4 {x = 60; y = 50; stage = 3; sprite_index = spr_soos_d}