image_speed = 0
image_alpha = 0
stage = 0
index = 0
count = 0
alpha = 0

if !variable_global_exists("wendyne") global.wendyne = 13
else if global.wendyne >= 14 instance_destroy()