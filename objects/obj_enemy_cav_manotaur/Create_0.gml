name = "Manotaur"
act = ["Check","Brain Magic","Jerky","Pain Hole"]
check = "Half man, half... taur.&Very manly man."
spare = false
run = true
hp = 16
maxhp = hp
at = 8
lv = false//set true if killing person increases LV
sb = 18
area = AREA.CAVES;
timer = 0
create = true
bubble = noone
deathx = 0

image_speed = 0
image_xscale = 2-4*(x>320)
image_yscale = 2
alarm[11] = 1+irandom(60)

obj_battleCore.text[0] = "A Manotaur arrives to #de-man-strate the essence of #true manliness!"
if instance_number(obj_battleEnemy) > 1 switch instance_find(obj_battleEnemy,0).object_index {
	case obj_enemy_cav_eyebat_passive:	obj_battleCore.text[0] = "A true Man has no fear of bats.&(I'm looking at you, #Eyebatman.)" break
	case obj_enemy_cav_fairy:			obj_battleCore.text[0] = "A Manotaur arrives, prepared to #install a bathroom exhaust fan." break
	case obj_enemy_cav_geodite:			obj_battleCore.text[0] = "A Geodite silently watches you.&A nearby Manotaur has found a #head-bashing rock." break
	case obj_enemy_cav_manotaur:		obj_battleCore.text[0] = "Two Manotaurs have met to bash #heads and crash in the Man Cave #afterward." break
	case obj_enemy_cav_scampfire:		obj_battleCore.text[0] = "Ah, fire: man's greatest #creation.&Not this man's creation though." break
}