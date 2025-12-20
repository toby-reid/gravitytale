image_speed = 0
image_alpha = 0
if !variable_global_exists("wendy") global.wendy = 2
else if global.wendy >= 3 instance_destroy()
stage = 0