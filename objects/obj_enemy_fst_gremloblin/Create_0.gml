name = "Gremloblin"
act = ["Check","Hide","Look","Water"]
check = "Half gremlin, half goblin.&When fighting one, use water..."
spare = false
run = true
hp = 14
maxhp = hp
at = 4
lv = false//set true if killing person increases LV
sb = 14
area = AREA.FOREST;
timer = 0
create = true
bubble = noone
hidden = false
lasers = []
deathx = 0

image_xscale = 2
image_yscale = 2
image_speed = .5
//if instance_exists(obj_toBattle) obj_toBattle.music = mus_mansong

obj_battleCore.text[0] = "A Gremloblin smashes its way #into view, confused why it is #here."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		case obj_enemy_fst_bCub:		obj_battleCore.text[0] = "Gremloblin does not know why #he is here!&Beard Cub wants to face off!" break
		case obj_enemy_fst_gnome:		obj_battleCore.text[0] = "Gnome has been running from #Gremloblin!&Gremloblin doesn't know why!" break
		case obj_enemy_fst_gremloblin:	obj_battleCore.text[0] = "Gremloblin does not know why #he is here!&Gremloblin doesn't know either!" break
		case obj_enemy_fst_kBilly:		obj_battleCore.text[0] = "The two most lethal forces in #the Forest have arrived for a #fierce beatdown!" break
		case obj_enemy_fst_plaidypus:	obj_battleCore.text[0] = "Gremloblin seeks a new hat!&Plaidypus seeks not to become #one!" break
		case obj_enemy_fst_qQuail:		obj_battleCore.text[0] = "Question Quail arrives to #question how water makes #Gremloblins stronger." break
	}
	image_index++
}
if x != 320 num = (x-320) / abs(x-320)
else num = 0