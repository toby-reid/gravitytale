obj_dipper.canMove = false
stage = 0
alarm[0] = 30
image_speed = 0
if !variable_global_exists("soos") global.soos = 0
if global.soos >= 3 instance_destroy()
else if instance_exists(obj_save) obj_save.image_alpha = 0