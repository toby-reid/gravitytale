image_alpha = 0
image_speed = 0
if !variable_global_exists("wendy") global.wendy = 8
else if global.wendy >= 9 instance_destroy()
stage = 0
index = 0//used to track axe