name = "Beard Cub"
act = ["Check","Shampoo","Shave","Burn"]
check = "Nests on lumberjacks' faces.&Strongest in No-Shave November."
spare = false
run = true
hp = 10
maxhp = hp
at = 2
lv = false//set true if killing person increases LV
sb = 6
area = AREA.FOREST;
stage = 1//keep at 1!
grow = 0
timer = 0
create = true
bubble = noone
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "An unkempt Beard Cub arrives #to steal your aftershave!"
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		case obj_enemy_fst_bCub:		obj_battleCore.text[0] = "Two Beard Cubs battle for #a place on the face!" break
		case obj_enemy_fst_gnome:		obj_battleCore.text[0] = "I've never been a beast of #bearden...&er, burden." break
		case obj_enemy_fst_gremloblin:	obj_battleCore.text[0] = "Gremloblin does not know why #he is here!&A Beard Cub wants to face off!" break
		case obj_enemy_fst_kBilly:		obj_battleCore.text[0] = "Two unkempt beards...&Actually, that one's something #else entirely..." break
		case obj_enemy_fst_plaidypus:	obj_battleCore.text[0] = "Uhhhh...&You ever seen a bearded #plaidypus before?" break
		case obj_enemy_fst_qQuail:		obj_battleCore.text[0] = "Question Quail arrives to #question the plausibility of a #sentient beard." break
	}
	image_index++
}