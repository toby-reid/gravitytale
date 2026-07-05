name = "Gobblewonkie"
act = ["Check","Lure","Hambone","Ham bone"]
check = "Mouth for gobbling, #long neck for wonking."
spare = false
run = true
hp = 8
maxhp = hp
at = 3
lv = false
sb = 9
area = AREA.SCUTTLEBUTT;
timer = 0
bubble = noone
deathx = 0

stage = 0
image_xscale = 2
image_yscale = 2
alarm[7] = 60

obj_battleCore.text[0] = "A baby Gobblewonker is hungry #for hands!"
if instance_number(obj_enemy) > 1 switch instance_find(obj_enemy,0).object_index {
	case obj_enemy_scb_beaver:    obj_battleCore.text[0] = "A baby Gobblewonker has decided #to attack.&A nearby Beaver wants to watch." break
	case obj_enemy_scb_cowl:      obj_battleCore.text[0] = "You stumble upon a Cowl while #Gobblewonkie attacks it." break
	case obj_enemy_scb_gobbie:    obj_battleCore.text[0] = "Two Gobblewonkies, two hands.&Seems we've reached an #agreement." break
	case obj_enemy_scb_hawktopus: obj_battleCore.text[0] = "A Hawktopus enters the scene.&Gobblewonkie just wants a #snack." break
	case obj_enemy_scb_merman:    obj_battleCore.text[0] = "A Gobblewonkie finds a meal.&Merman sits helplessly." break
	case obj_enemy_scb_sDuck:     obj_battleCore.text[0] = "A Stomach-Faced Duck challenges #you to a duel.&Gobblewonkie wants a snack." break
}