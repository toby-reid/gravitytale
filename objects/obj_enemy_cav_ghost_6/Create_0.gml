/// @description Parent of all other ghosts
categories = [obj_enemy_cav_ghost_1,obj_enemy_cav_ghost_2,obj_enemy_cav_ghost_3,obj_enemy_cav_ghost_4,obj_enemy_cav_ghost_5,obj_enemy_cav_ghost_6,obj_enemy_cav_ghost_7,obj_enemy_cav_ghost_8,obj_enemy_cav_ghost_9,obj_enemy_cav_ghost_10]
name = "Phantoms of Pain"
act = ["Check","Confirm","Face","Deny"]
check = "Luckily, they won't touch you #unless you summon them."
spare = false
run = true
hp = 0
maxhp = hp
at = 6
lv = false//set true if killing person increases LV
sb = 0
area = AREA.UNKNOWN;
timer = 0
bubble = noone

attention = 1;
alarm[11] = 30 + irandom(60)

image_xscale = 2
image_yscale = 2
image_alpha = 0

obj_battleCore.text[0] = "Category Sixes dress in black #leather and have painful #jewelry in various body parts."