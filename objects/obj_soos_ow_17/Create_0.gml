stage = 0
image_speed = 0
if !variable_global_exists("soos") global.soos = 16
else if global.soos >= 17 {obj_buttSwitch.done = true; obj_scb_barrier.size = 1; instance_destroy()}