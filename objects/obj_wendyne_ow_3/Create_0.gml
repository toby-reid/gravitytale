image_speed = 0
image_alpha = 0
if !variable_global_exists("wendyne") global.wendyne = 2
else if global.wendyne >= 3 instance_destroy()
stage = 0