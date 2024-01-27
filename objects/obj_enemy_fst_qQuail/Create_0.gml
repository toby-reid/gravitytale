name = "Question Quail"
act = ["Check","Ask","Answer","Confound"]
check = "Known by question markings.&Perhaps cousin of Aposto-Finch?"
spare = false
run = true
hp = 8
maxhp = hp
at = 3
lv = false//set true if killing person increases LV
sb = 6
zone = area.forest
timer = 0
create = true
bubble = noone
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "Owls say \"WHO.\"&This bird says \"WHERE?\", #\"WHY?\", and \"WHEN?\"."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		case obj_enemy_fst_bCub:		obj_battleCore.text[0] = "Question Quail arrives to #question the plausibility of #a sentient beard." break
		case obj_enemy_fst_gnome:		obj_battleCore.text[0] = "Question Quail arrives to #question why Gnomes must kidnap #to get a queen." break
		case obj_enemy_fst_gremloblin:	obj_battleCore.text[0] = "Question Quail arrives to #question how water makes #Gremloblins stronger." break
		case obj_enemy_fst_kBilly:		obj_battleCore.text[0] = "Question Quail arrives to #question why Kill Billies exist #in the first place." break
		case obj_enemy_fst_plaidypus:	obj_battleCore.text[0] = "Question Quail arrives to #question the plausibility of #animals in government agencies." break
		case obj_enemy_fst_qQuail:		obj_battleCore.text[0] = "Question Quail arrives to &Question Quail arrives to &Question Quail arrives to" break
	}
	image_index++
}