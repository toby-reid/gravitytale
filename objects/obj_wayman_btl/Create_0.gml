name = "???"
act = ["???","???","???","???"]
check = "???"
spare = false
run = false
ini_open("Reset.save")
if ini_read_real("C","W",0) > 0 run = true
ini_close()
hp = 1
maxhp = hp
at = 0
lv = false//set true if killing person increases LV
sb = 0
area = AREA.UNKNOWN
bubble = noone
timer = 0//used to determine when time runs out
maxTime = [340,520,520,0,0,0,0,0,0,0,0]//max allowed time for each stage
stage = 0//dictates which maze to lay out
stageRepeating = false//set to true if timer (or alarm) reaches limit without finishing maze
image_xscale = 2
image_yscale = 2

global.enemy = [id]
obj_battleCore.text[0] = "A shadowy figure with a bright #smile stands before you."
audio_play_sound(mus_rushB_intro,0,false)

drawy = 90//sprite_height