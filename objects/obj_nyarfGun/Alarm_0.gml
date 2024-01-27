///@desc global.stage[0] = 4
instance_destroy()
instance_destroy(obj_battleTarget)
global.stage[0]++
for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[4] = 1