name = "Stomach-Faced Duck"
act = ["Check","Quack","Blanket","Feed"]
check = "Vicious bird of the water.&Innards seen through its mouth."
spare = false
run = true
hp = 5
maxhp = hp
at = 3
lv = false
sb = 6
area = AREA.SCUTTLEBUTT;
timer = 0
create = true
bubble = noone
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "A Stomach-Faced Duck #approaches, quacking #aggressively."
if instance_number(obj_enemy) > 1 {
	switch instance_find(obj_enemy,0).object_index {
		case obj_enemy_scb_beaver:    obj_battleCore.text[0] = "Stomach-Faced Duck wants to #fight!&Beaver just wants to watch." break
		case obj_enemy_scb_cowl:      obj_battleCore.text[0] = "You stumble upon a Cowl.&Stomach-Faced Duck now wants #to battle." break
		case obj_enemy_scb_gobbie:    obj_battleCore.text[0] = "A Stomach-Faced Duck challenges #you to a duel.&Gobblewonkie wants a snack." break
		case obj_enemy_scb_hawktopus: obj_battleCore.text[0] = "SF Duck wants to fight!&Birds of a bomination flock #together." break
		case obj_enemy_scb_merman:    obj_battleCore.text[0] = "A Merman \"attacks\"!&Stomach-Faced Duck emerges to #battle for real!" break
		case obj_enemy_scb_sDuck:     obj_battleCore.text[0] = "SF Duck wants to fight!&Stomach-Faced Duck sends in #Stomach-Faced Duck!"
	}
	image_index++
}