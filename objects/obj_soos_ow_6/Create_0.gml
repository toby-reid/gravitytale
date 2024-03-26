image_speed = 0
stage = 0
if(!variable_global_exists("soos")) global.soos = 0;
if global.soos >= 6 instance_destroy()
else if global.soos > 5 {x = 100; y = 40; stage = 3; sprite_index = spr_soos_d}