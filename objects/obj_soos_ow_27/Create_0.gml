image_speed = 0
if variable_global_exists("soos") {if global.soos >= 27 if(global.killed[enemy.soos] or global.spared[enemy.soos]) instance_destroy()}
else global.soos = 0
active = false