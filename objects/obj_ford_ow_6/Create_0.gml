stage = 0
image_speed = 0
if !variable_global_exists("stans") global.stans = 0
if global.stans >= 6 instance_destroy()