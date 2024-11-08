obj_battleCore.text[0] = "Grunkle Stans is ready to #fight!"
global.enemy = [id]
global.stage[0] = 4
bubble = instance_create_layer(x+60,y,layer,obj_textBubble)
with bubble {
	text = [
		"it's a beautiful day outside.",
		"woodpeckers are pecking.",
		"crickets are chirping.",
		". . .",
		"but that doesn't matter, since we're not outside, huh?"
	]
	for(var i = 0; i < array_length(text); i++) {font[i] = fnt_sans_bubble; sound[i] = tlk_stans}
	image_index = 1
}
sprite_index = spr_stans_head_content
name = "Grunkle Stans"
act = ["Check","Suck Up","Joke","Fishing"]
check = "The weakest opponent.&Seems not to care about this."
spare = false
run = false
hp = 1
maxhp = hp
at = 1
lv = false//set true if killing person increases LV
sb = 0
area = AREA.UNKNOWN;
timer = 0
create = true
stage = 0
path_start(pth_float,.1,path_action_restart,false)

image_xscale = 2
image_yscale = 2