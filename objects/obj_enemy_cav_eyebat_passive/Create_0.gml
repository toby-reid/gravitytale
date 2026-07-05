name = "Eyebat"
act = ["Check","Look","Contact","Tear"]
check = "A winged floating eyeball.&Passive until disturbed."
spare = false
run = true
hp = 9
maxhp = hp
at = 0
lv = false//set true if killing person increases LV
sb = 8
area = AREA.CAVES;
timer = 0
create = true
bubble = noone
deathx = 0

active = false//1 for eye-opening anim, 2 for active
image_speed = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "An unknown enemy dangles from #the ceiling!&You'd batter leave it alone."
if instance_number(obj_enemy) > 1 switch instance_find(obj_enemy,0).object_index {
	case obj_enemy_cav_eyebat_passive:	obj_battleCore.text[0] = "Two Eyebats?&I guess you could call that...&Depth perception." break
	case obj_enemy_cav_fairy:			obj_battleCore.text[0] = "Something is stuck to the #ceiling, out of Barf Fairy's #range!" break
	case obj_enemy_cav_geodite:			obj_battleCore.text[0] = "A pair of glowing eyes and a #single floating eye...&Better watch yourself." break
	case obj_enemy_cav_manotaur:		obj_battleCore.text[0] = "A true Man has no fear of bats.&(I'm looking at you, #Eyebatman.)" break
	case obj_enemy_cav_scampfire:		obj_battleCore.text[0] = "An Eyebat arrives, disturbed by #the light of fire." break
}