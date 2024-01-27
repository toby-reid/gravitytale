name = "Barf Fairy"
act = ["Check","Swat","Harvest","Talk to Saria"]
check = "Exactly what they sound like.&Bites are toxic."
spare = false
run = true
hp = 7
maxhp = hp
at = 5
lv = false//set true if killing person increases LV
sb = 8
zone = area.caves
timer = 0
create = true
bubble = noone
deathx = 0
harvested = false
index = 0//used for the wings

image_xscale = 2 - 4*(x > 340) - 4*(x == 320)*irandom(1)
image_yscale = 2
image_speed = 0
if !variable_global_exists("fairydust") global.fairydust = 0

obj_battleCore.text[0] = "Perhaps you should don a #rain jacket."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		//case obj_enemy_cav_eyebat:
		case obj_enemy_cav_eyebat_passive:	obj_battleCore.text[0] = "Something is stuck to the #ceiling, out of Barf Fairy's #range!" break
		case obj_enemy_cav_fairy:			obj_battleCore.text[0] = "Tatl and Tael are here for #Skull Kid's...&Wait..." break
		case obj_enemy_cav_geodite:			obj_battleCore.text[0] = "Of quartz it's a Barf Fairy.&You recognized its foul stench #the moment you entered." break
		case obj_enemy_cav_manotaur:		obj_battleCore.text[0] = "A Manotaur arrives, prepared to #install a bathroom exhaust fan." break
		case obj_enemy_cav_scampfire:		obj_battleCore.text[0] = "Vomit and fire don't mix.&Just trust me on that." break
	}
	image_index++
}