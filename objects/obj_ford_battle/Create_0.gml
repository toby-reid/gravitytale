if !variable_global_exists("stans") global.stans = 21
global.stage[0] = 4
global.stage[1] = 4
bubble = instance_create_layer(x+60,y,"Instances",obj_textBubble)
with bubble {
	image_index = 1
	headid = -1
	text = [
		"HERE WE \nGO, CHILD!",
		"YOU MAY BE \nWONDERING \nWHY I AM \nTAKING MY \nTURN FIRST.",
		"AFTER ALL, \nYOU \nUSUALLY \nMAKE THE \nSTARTING \nACTION, \nRIGHT?",
		"WELL, IT IS \nTIME TO \nTEST MY \nLATEST \nINVENTION.",
		"BEHOLD, \nCHILD!",
		"THE \nGRAVITY \nFALL \nMODEL F!"
	]
	if global.stans >= 22 text = ["HERE WE GO, CHILD!"]
	font = [fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble,fnt_papyrus_bubble]
	sound = [tlk_ford,tlk_ford,tlk_ford,tlk_ford,tlk_ford,tlk_ford]
}

name = "Stanford Pines"
act = ["Check","Theory","Bill Cipher","Quantum Physics"]
check = "Smartest man in the world.&Worked for Bill Cipher long ago."
spare = false
run = true
hp = 40
maxhp = hp
at = 4
lv = true//set true if killing person increases LV
sb = 60
area = AREA.UNKNOWN;
timer = 0
create = true
deathx = 0
stage = -1
is_genocide = false;

image_xscale = 2
image_yscale = 2
image_speed = 0

global.enemy = [id]
obj_battleCore.text[0] = "Grunkle Ford can save this #dimension when all of Bill's #puppets are destroyed!"
if (global.player.genocide == RUN.ACTIVE and global.areaKills[AREA.FOREST] >= global.MAX_KILLS[AREA.FOREST])
{
    is_genocide = true;
	obj_battleCore.text[0] = "Grunkle Ford demonstrates how #to win without killing!&He is trying to spare you!"
	run = false
	spare = true
	bubble.text = [
		"CHILD!",
		"I BELIEVE YOU CAN STILL CHANGE!",
		"THAT IS WHY I WILL BE SURRENDERING!",
		"I AM GIVING YOU THE CHANCE TO STOP THIS ROUTE, CHILD!",
		"PLEASE, TAKE IT..."
	]
	bubble.headid = -2
	obj_soul.image_index = 1
}