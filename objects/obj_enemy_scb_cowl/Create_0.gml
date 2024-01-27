name = "Cowl"
act = ["Check","Eggs","Pun","Milk"]
check = "Part cow, part owl.&Lays milk-filled eggs."
spare = true
run = true
hp = 4
maxhp = hp
at = 1
lv = false
sb = 3
zone = area.scuttlebutt
timer = 0
bubble = noone
deathx = 0

rot = 0//current angle
angle = 0//destination angle
alarm[6] = irandom(240)+60

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "You tripped over Cowl whilst #conquering a tree root."
if instance_number(obj_battleEnemy) > 1 switch instance_find(obj_battleEnemy,0).object_index {
	case obj_enemy_scb_beaver:    obj_battleCore.text[0] = "You stumble upon a Cowl.&Beaver wants to see." break
	case obj_enemy_scb_cowl:      obj_battleCore.text[0] = "You tripped over Cowl on a #tree root.&Cowl trips over you as well." break
	case obj_enemy_scb_gobbie:    obj_battleCore.text[0] = "You stumble upon a Cowl while #Gobblewonkie attacks it." break
	case obj_enemy_scb_hawktopus: obj_battleCore.text[0] = "You stumble upon a Cowl.&Hawktopus emerges to stumble #upon you." break
	case obj_enemy_scb_merman:    obj_battleCore.text[0] = "You somehow trip over both #Merman and Cowl at the same #time." break
	case obj_enemy_scb_sDuck:     obj_battleCore.text[0] = "Whose bird-brained idea was it #to put these into the game?" break
}