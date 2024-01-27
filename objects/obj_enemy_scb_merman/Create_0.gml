name = "Merman"
act = ["Check","Listen","Water","Legs"]
check = "Half man, half mer.&Needs water to survive."
spare = false
run = true
hp = 6
maxhp = hp
at = 1
lv = false//set true if killing person increases LV
sb = 5
zone = area.scuttlebutt
timer = 0
water = 0
bubble = noone
bubbleText = ""
deathx = 0

alarm[7] = irandom(29)+1
image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "Mermando... attacks?"
if instance_number(obj_battleEnemy) > 1 switch instance_find(obj_battleEnemy,0).object_index {
	case obj_enemy_scb_beaver:    obj_battleCore.text[0] = "A Merman... attacks..?&A Beaver stops to help." break
	case obj_enemy_scb_cowl:      obj_battleCore.text[0] = "You trip over both Merman and #Cowl at the same time." break
	case obj_enemy_scb_gobbie:    obj_battleCore.text[0] = "A Gobblewonkie finds its meal.&A Merman sits helplessly." break
	case obj_enemy_scb_hawktopus: obj_battleCore.text[0] = "A Merman tries to attack!&Hawktopus emerges to help." break
	case obj_enemy_scb_merman:    obj_battleCore.text[0] = "Two Mermans...&...Mermen...&...attack." break
	case obj_enemy_scb_sDuck:     obj_battleCore.text[0] = "A Merman \"attacks\"!&Stomach-Faced Duck emerges to #battle for real!" break
}