image_speed = 0
image_alpha = 0
stage = 0
index = 0
count = 0
alpha = 0

if !variable_global_exists("wendy") global.wendy = 13
else if global.wendy >= 14 instance_destroy()