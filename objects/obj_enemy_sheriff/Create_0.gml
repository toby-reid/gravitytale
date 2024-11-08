name = "Sheriff Blubs"
act = ["Check","Dismiss","Discuss","Desist"]
check = "Sheriff of Roadkill County.&Cares deeply for his deputy."
spare = false
run = false
hp = 15
maxhp = hp
at = 6
lv = true//set true if killing person increases LV
sb = 20
area = AREA.UNKNOWN;
timer = 0
create = true
bubble = noone
bubbleText = "Solvin' some big crisis, city boy?"
deathx = 0
stage = 0

image_xscale = 2
image_yscale = 2
image_index = 1
arm = 0

obj_battleCore.text[0] = "Sheriff Blubs and Deputy Durland #are running a live background #check!"
global.enemy = [obj_enemy_sheriff,obj_enemy_deputy]