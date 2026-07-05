name = "Geodite"
act = ["Check","Imitate",choose("Rock","Paper","Scissors"),"Stall"]
check = "Resembles a cluster of geodes.&Gives off a faint glow."
spare = false
run = true
hp = 15
maxhp = hp
at = 3
lv = false//set true if killing person increases LV
sb = 15
area = AREA.CAVES;
timer = 0
create = true
bubble = noone
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "A pair of glowing eyes watches #you from the darkness!"
if instance_number(obj_enemy) > 1 switch instance_find(obj_enemy,0).object_index {
	case obj_enemy_cav_eyebat_passive:	obj_battleCore.text[0] = "A pair of glowing eyes and a #single floating eye...&Better watch yourself." break
	case obj_enemy_cav_fairy:			obj_battleCore.text[0] = "Of quartz it's a Barf Fairy.&You recognized its foul stench #the moment you entered." break
	case obj_enemy_cav_geodite:			obj_battleCore.text[0] = "It seems we have reentered the #Stone Age." break
	case obj_enemy_cav_manotaur:		obj_battleCore.text[0] = "A Geodite silently watches you.&A nearby Manotaur has found a #head-bashing rock." break
	case obj_enemy_cav_scampfire:		obj_battleCore.text[0] = "Geodites can be struck together #to create spark.&Maybe that created Scampfire?" break
}