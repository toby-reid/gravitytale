/// @description Parent of all other ghosts
categories = [obj_enemy_cav_ghost_1,obj_enemy_cav_ghost_2,obj_enemy_cav_ghost_3,obj_enemy_cav_ghost_4,obj_enemy_cav_ghost_5,obj_enemy_cav_ghost_6,obj_enemy_cav_ghost_7,obj_enemy_cav_ghost_8,obj_enemy_cav_ghost_9,obj_enemy_cav_ghost_10]
name = "Prankster " + string(instance_number(obj_enemy_cav_ghost)-1)
act = ["Check","Encourage","Prank","Hair"]
check = "Always appear in groups of two #or three for maximal prankage."
spare = false
run = true
hp = 0
maxhp = hp
at = 2
lv = false//set true if killing person increases LV
sb = 0
zone = area.unknown
timer = 0
bubble = noone

image_xscale = 2
image_yscale = 2
image_alpha = 0

if instance_number(obj_enemy_cav_ghost) < 3 {
	x = 192
	global.enemy[1] = instance_create_layer(448,y,layer,obj_enemy_cav_ghost_2)
}
else image_index = 1

obj_battleCore.text[0] = "Category Twos always have #\"Kick me!\" or \"Possess me!\" #signs they tape to your back."