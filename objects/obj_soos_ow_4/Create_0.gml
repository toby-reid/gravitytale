stage = 0
image_speed = 0
if !variable_global_exists("soos") global.soos = 0
if global.soos >= 4 instance_destroy()