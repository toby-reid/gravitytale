/// @description Parent of all other ghosts
categories = [obj_enemy_cav_ghost_1,obj_enemy_cav_ghost_2,obj_enemy_cav_ghost_3,obj_enemy_cav_ghost_4,obj_enemy_cav_ghost_5,obj_enemy_cav_ghost_6,obj_enemy_cav_ghost_7,obj_enemy_cav_ghost_8,obj_enemy_cav_ghost_9,obj_enemy_cav_ghost_10]
name = "Soul Sucker"
act = ["Check","Remove","Swat","Soul"]
check = "It will get bigger when it #consumes a SOUL."
spare = false
run = true
hp = 0
maxhp = hp
at = 5
lv = false//set true if killing person increases LV
sb = 0
zone = area.unknown
timer = 0
bubble = noone

path_start(pth_float,.1,path_action_continue,false)

image_xscale = 2
image_yscale = 2
image_alpha = 0

obj_battleCore.text[0] = "Category Fives feed off the #life force of their human prey.&They work slowly and silently."