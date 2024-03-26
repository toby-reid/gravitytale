///@desc Room CC: text[0],global.enemy[]
///@desc obj_toBattle: goto
global.stage = [0,0,0,0,-1,0]
scr_btl_itemSelect(1)
//[0]whereWeAre (0battleButtons, 1enemySelect/itemSelect, 2fightTarget/actionSelect/spareRun, 3damageAnimation/textResponse (create text bubble), 4battle, 5transition
//[1]battleButtons 0-3; [2]enemyList 0-2; [3]itemList 0-7; [4]damage/spareRun 0-5/0-1, [5]actChoice 0-3

text = ["An error has occurred.&Error code: BTLTX","An error has occurred.&Error code: BTLTX"]//Room CC should cover text[0]
charCount = 0
lv = 0//Set higher if you kill someone important
sb = 0//How many Stan Bucks are earned at the end
goto = room_previous(room)//Should be changed by obj_toBattle
music = silence;//Music to play after battle Ends. Will not play if still noone.
battle = false

for(i = 0; i < 4; i++) with instance_create_layer(33+i*156,431,"Instances",obj_battleButtons) image_index = other.i

global.enemy = []//CC should Create enemies
if !variable_global_exists("runemy") global.runemy = []
//Draw event will clear global.runemy; CC should test for it.
audio_group_load(Battle)

image_yscale = 2
image_xscale = 2
alarm[0] = 1