name = "Gnome"
act = ["Check","Shovel","Leaf Blower","Queen"]
spare = false
run = true
hp = 5
maxhp = hp
at = 3
lv = false
sb = 8
zone = area.forest
timer = 0
create = true
bubble = noone
check = "Common Gnome. Seeks a queen.&Very weak on its own."
bubbleText = "..."
stage = 0
deathx = 0
flipped = 0

image_xscale = 2
image_yscale = 2
image_speed = 0
alarm[11] = 20

obj_battleCore.text[0] = "Common Gnome enters the scene;&this common Gnome, he seeks a #queen."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		case obj_enemy_fst_bCub:		obj_battleCore.text[0] = "I've never been a beast of #bearden...&er, burden." break
		case obj_enemy_fst_gnome:		obj_battleCore.text[0] = "Two Gnomes have teamed up!&Their AT have increased by 2!&(Gnomes together strong)"; obj_enemy_fst_gnome.at += 2 break
		case obj_enemy_fst_gremloblin:	obj_battleCore.text[0] = "Gnome has been running from #Gremloblin!&Gremloblin doesn't know why!" break
		case obj_enemy_fst_kBilly:		obj_battleCore.text[0] = "Kill Billy will eat anything!&Gnome does not want to be #\"anything\"!" break
		case obj_enemy_fst_plaidypus:	obj_battleCore.text[0] = "Plaidypus may or may not be #investigating Dr. Shmebulock's #next evil -inator." break
		case obj_enemy_fst_qQuail:		obj_battleCore.text[0] = "Question Quail arrives to #question why Gnomes must kidnap #to marry." break
	}
	image_index++
}