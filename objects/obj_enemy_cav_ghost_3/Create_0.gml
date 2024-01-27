/// @description Parent of all other ghosts
categories = [obj_enemy_cav_ghost_1,obj_enemy_cav_ghost_2,obj_enemy_cav_ghost_3,obj_enemy_cav_ghost_4,obj_enemy_cav_ghost_5,obj_enemy_cav_ghost_6,obj_enemy_cav_ghost_7,obj_enemy_cav_ghost_8,obj_enemy_cav_ghost_9,obj_enemy_cav_ghost_10]
name = "Glutton"
act = ["Check","Eat","Poison","Feed"]
check = "Inspiration for \"Gooer\" from #the movie \"Phantom Bust-ifiers\"."
spare = false
run = true
hp = 0
maxhp = hp
at = 3
lv = false//set true if killing person increases LV
sb = 0
zone = area.unknown
timer = 0
bubble = noone

stage = 0

path_start(pth_float,.1,path_action_continue,false)

image_xscale = 2
image_yscale = 2
image_alpha = 0

obj_battleCore.text[0] = "A rather repulsive ghoulutton.&These rapacious wraiths make an #incredible amount of body odor."