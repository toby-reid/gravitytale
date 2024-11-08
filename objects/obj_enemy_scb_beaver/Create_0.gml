name = "Beaver"
act = ["Check","Hug","Picture","Smack"]
check = "Native to Scuttlebutt Island.&Loves cavorting and hugging."
spare = true
run = true
hp = 5
maxhp = hp
at = 1
lv = false
sb = 4
area = AREA.SCUTTLEBUTT;
timer = 0
bubble = noone
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "A local Beaver is curious about #your presence."
if instance_number(obj_battleEnemy) > 1 {
	switch global.enemy[0].object_index {
		case obj_enemy_scb_beaver:    obj_battleCore.text[0] = "Two Beavers have met to hug." break
		case obj_enemy_scb_cowl:      obj_battleCore.text[0] = "You stumble upon a Cowl.&Beaver wants to see." break
		case obj_enemy_scb_gobbie:    obj_battleCore.text[0] = "A baby Gobblewonker has decided #to attack.&A nearby Beaver wants to watch." break
		case obj_enemy_scb_hawktopus: obj_battleCore.text[0] = "A Beaver curiously watches you.&A nearby baby Hawktopus #investigates its prey." break
		case obj_enemy_scb_merman:    obj_battleCore.text[0] = "A Merman... attacks..?&A Beaver stops to help." break
		case obj_enemy_scb_sDuck:     obj_battleCore.text[0] = "Stomach-Faced Duck wants to #fight!&Beaver just wants to watch." break
	}
	image_index++
}

hug = 0//goes negative with smacking