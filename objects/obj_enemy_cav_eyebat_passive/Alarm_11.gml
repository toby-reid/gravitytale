/// @description Awaken, my masters!
/*stage = 2
sprite_index = spr_enemy_cav_eyebat
image_speed = 1*/
var index = 0
for(var i = 0; i < array_length(global.enemy); i++) if global.enemy[i] == id index = i
global.enemy[index] = instance_create_layer(x,y,layer,obj_enemy_cav_eyebat)
global.enemy[index].bubble = bubble
global.enemy[index].hp = hp
instance_destroy()