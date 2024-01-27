/// @description Parent of all other ghosts
categories = [obj_enemy_cav_ghost_1,obj_enemy_cav_ghost_2,obj_enemy_cav_ghost_3,obj_enemy_cav_ghost_4,obj_enemy_cav_ghost_5,obj_enemy_cav_ghost_6,obj_enemy_cav_ghost_7,obj_enemy_cav_ghost_8,obj_enemy_cav_ghost_9,obj_enemy_cav_ghost_10]
name = "The Petrifying Rock"
act = ["Check","Rock","Paper","Scissors"]
check = "Seems exasperated about not #coordinating with Cat. 7."
spare = false
run = true
hp = 0
maxhp = hp
at = 8
lv = false//set true if killing person increases LV
sb = 0
zone = area.unknown
timer = 0
bubble = noone

drawx = 0
rocks = []
attention = 2

image_xscale = 2
image_yscale = 2
image_alpha = 0
y = 200

obj_battleCore.text[0] = "It's the Category Seven's #purpose: to unleash KRXCKXL #the Unperceivable with Eight."