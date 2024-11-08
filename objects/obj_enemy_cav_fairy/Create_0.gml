name = "Fairy"
act = ["Check","Swat","Harvest","Talk to Saria"]
check = "Cousins of the Barf Fairies.&Gives advice...and fairy bites."
spare = false
run = true
hp = 7
maxhp = hp
at = 5
lv = false//set true if killing person increases LV
sb = 8
area = AREA.CAVES;
timer = 0
create = true
bubble = noone
deathx = 0
harvested = false

image_xscale = 2
image_yscale = 2
if !variable_global_exists("fairydust") global.fairydust = 0

obj_battleCore.text[0] = "I'm fairy certain this will be #a cinch."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		//case obj_enemy_cav_eyebat:
		case obj_enemy_cav_eyebat_passive:	obj_battleCore.text[0] = "Two flying beasts have arrived #to fight!" break
		case obj_enemy_cav_fairy:			obj_battleCore.text[0] = "Tatl and Tael are here for #Skull Kid's...&Wait..." break
		case obj_enemy_cav_geodite:			obj_battleCore.text[0] = "Of quartz it had to be a #fairy..." break
		case obj_enemy_cav_manotaur:		obj_battleCore.text[0] = "A Manotaur arrives, #disappointed in the nearby #(unmanly) Fairy." break
		case obj_enemy_cav_scampfire:		obj_battleCore.text[0] = "Magic and fire don't mix.&Just trust me on that." break
	}
	image_index++
}