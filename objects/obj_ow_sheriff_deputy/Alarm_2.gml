/// @description turn around, start the battle
if image_xscale == 1 {
	image_xscale = -1
	alarm[2] = 30
}
else if image_index == 0 or global.killed[enemy.sheriff] {
	with instance_create_layer(0,0,"Instances",obj_toBattle) {
		goto = btl_fst_17_sheriff
		music = mus_strongerMonsters
	}
	alarm[3] = 120
}