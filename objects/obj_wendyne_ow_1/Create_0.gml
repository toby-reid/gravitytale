image_speed = 0
image_alpha = 0
stage = 0
if !variable_global_exists("wendy") global.wendy = 0
else if global.wendy >= 1 instance_destroy()
else if global.wendy == .1 stage = 1
else if global.wendy == .3 stage = 3
index = -1