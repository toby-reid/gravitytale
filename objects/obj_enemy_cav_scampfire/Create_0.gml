name = "Scampfire"
act = ["Check","Water","Feed","Terminate"]//terminate - You're being let go. You're fired.; Water - sprite_index to just legs
check = "Spiderlike beast.&Poses as a common campfire."
spare = false
run = true
hp = 12
maxhp = hp
at = 3
lv = false//set true if killing person increases LV
sb = 12
area = AREA.CAVES;
timer = 0
if instance_number(obj_battleEnemy) == 2 timer = 30
create = true
bubble = noone
deathx = 0

image_xscale = 2
image_yscale = 2

obj_battleCore.text[0] = "A scampering campfire arrives #to feed on your combustible #Items."
if instance_number(obj_battleEnemy) > 1 {
	switch instance_find(obj_battleEnemy,0).object_index {
		case obj_enemy_cav_eyebat_passive:	obj_battleCore.text[0] = "An Eyebat arrives, disturbed by #the light of fire." break
		case obj_enemy_cav_fairy:			obj_battleCore.text[0] = "Vomit and fire don't mix.&Just trust me on that." break
		case obj_enemy_cav_geodite:			obj_battleCore.text[0] = "Geodites can be struck together #to create spark.&Maybe that created Scampfire?" break
		case obj_enemy_cav_manotaur:		obj_battleCore.text[0] = "Ah, fire: man's greatest #creation.&Not this man's creation though." break
		case obj_enemy_cav_scampfire:		obj_battleCore.text[0] = "Burning passion.&Flames of desire.&You shouldn't play with fire." break
	}
	image_index += 2
}