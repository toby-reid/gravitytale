name = "Plaidypus"
act = ["Check","Pelt","Nothing","Hat"]
check = "Source of lumberjacks' jackets.&They don't do much."
spare = true
run = true
hp = 5
maxhp = hp
at = 2
lv = false//set true if killing person increases LV
sb = 6
zone = area.forest
timer = 0
create = true
bubble = noone
deathx = 0
if irandom(15) == 0 {hat = 1; name = "Perky the Plaidypus"}
else hat = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "He's a semi-aquatic, egg-laying #mammal of...&Flannel..."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		case obj_enemy_fst_bCub:		obj_battleCore.text[0] = "Uhhhh...&You ever seen a bearded #Plaidypus before?" break
		case obj_enemy_fst_gnome:		obj_battleCore.text[0] = "Plaidypus may or may not be #investigating Dr. Shmebulock's #next evil -inator." break
		case obj_enemy_fst_gremloblin:	obj_battleCore.text[0] = "Gremloblin seeks a new hat!&Plaidypus seeks not to become #one!" break
		case obj_enemy_fst_kBilly:		obj_battleCore.text[0] = "Kill Billy is ready to make #his next hat.&Plaidypus is not into that." break
		case obj_enemy_fst_plaidypus:	obj_battleCore.text[0] = "Two plaidypuses...&Plaidypi? Platypods? ...&Not this again..." break
		case obj_enemy_fst_qQuail:		obj_battleCore.text[0] = "Question Quail arrives to #question the plausibility of #animals in government agencies." break
	}
	image_index++
}