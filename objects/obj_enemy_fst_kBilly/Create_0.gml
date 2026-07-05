name = "Kill Billy"
act = ["Check","Burnpile Style","Roadkill Grill","Junkyard Reward"]
check = "Feral, fanged, glow-eyed... man?&Bears a bluegrass music aura."
spare = false
run = true
hp = 8
maxhp = hp
at = 5
lv = false//set true if killing person increases LV
sb = 13
area = AREA.FOREST;
timer = 0
create = true
bubble = noone
stage = 0
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "Kill Billy arrives to suck #your blood and steal your #overalls!"
if instance_number(obj_enemy) > 1 {
	switch instance_find(obj_enemy,0).object_index {
		case obj_enemy_fst_bCub:		obj_battleCore.text[0] = "Two unkempt beards...&Actually, that one's something #else entirely..." break
		case obj_enemy_fst_gnome:		obj_battleCore.text[0] = "Kill Billy will eat anything!&Gnome does not want to be #\"anything\"!" break
		case obj_enemy_fst_gremloblin:	obj_battleCore.text[0] = "The two most lethal forces in #the Forest have arrived for a #fierce beatdown!" break
		case obj_enemy_fst_kBilly:		obj_battleCore.text[0] = "It's a family gathering of the #infamous Beverly Kill Billies!" break
		case obj_enemy_fst_plaidypus:	obj_battleCore.text[0] = "Kill Billy is ready to make #his next hat.&Plaidypus is not into that." break
		case obj_enemy_fst_qQuail:		obj_battleCore.text[0] = "Question Quail arrives to #question why Kill Billies exist #in the first place." break
	}
	image_index++
}