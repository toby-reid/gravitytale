active = false
teleport = false
drawx[320] = 0
change[320] = 0
changeDir[320] = 0
changeChange[320] = 0
loc = 0
if !variable_global_exists("teleport") global.teleport = false
if !global.spared[enemy.wayman] and !global.killed[enemy.wayman] instance_create_layer(0,0,layer,obj_wayman_ow)
///@desc CC: global.player[player.portalPotty]s