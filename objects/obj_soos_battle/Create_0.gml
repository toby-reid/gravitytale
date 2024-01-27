name = "Soos"
act = ["Check","Insult","Talk","Nothing"]
check = "Handyman at the Mystery Shack.&Wishes only for your safety."
spare = false
run = true
hp = 40
maxhp = hp
at = 3
lv = true//set true if killing person increases LV
sb = 50
zone = area.unknown
timer = 0
talk = 0
stage = 0//Increases with Sparing
attack = irandom(3)//0 bBites, 1 fist, 2 qMark, 3 sDriver
bubble = noone

obj_battleCore.text[0] = "Soos blocks your path!"
global.enemy = [id]

image_xscale = 2
image_yscale = 2
image_speed = 0