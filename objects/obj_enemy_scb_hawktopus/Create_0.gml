name = "Hawktopus"
act = ["Check","Study","Feed","Ink"]
check = "Too stupid to study."
spare = false
run = true
hp = 7
maxhp = hp
at = 2
lv = false
sb = 6
area = AREA.SCUTTLEBUTT;
timer = 0
bubble = noone
deathx = 0

ink = 0
image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "A Hawktopus emerges to #continue its lifecycle!"
if instance_number(obj_enemy) > 1 {
	switch instance_find(obj_enemy,0).object_index {
		case obj_enemy_scb_beaver:    obj_battleCore.text[0] = "A Beaver curiously watches you.&A nearby baby Hawktopus #investigates its prey." break
		case obj_enemy_scb_cowl:      obj_battleCore.text[0] = "You stumble upon a Cowl.&Hawktopus emerges to stumble #upon you." break
		case obj_enemy_scb_gobbie:    obj_battleCore.text[0] = "A Hawktopus enters the scene.&Gobblewonkie just wants a #snack." break
		case obj_enemy_scb_hawktopus: obj_battleCore.text[0] = "Two Hawktopuses...&Hawktopi? Hawktopods? ...&A Hawktopus and another one...!" break
		case obj_enemy_scb_merman:    obj_battleCore.text[0] = "A Merman tries to attack!&A Hawktopus emerges to help." break
		case obj_enemy_scb_sDuck:     obj_battleCore.text[0] = "SF Duck wants to fight!&Birds of a bomination flock #together." break
	}
	image_index++
}