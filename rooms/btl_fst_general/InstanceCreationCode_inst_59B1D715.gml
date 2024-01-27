global.battleTimer = 300

if global.areaKilled[area.forest] < global.areaMax[area.forest] {
	randomize()//Just for testing purposes
	var enemyCT = irandom(1)+1
	var enemies = []
	for(var i=0;i<enemyCT;i++) enemies[i] = choose(obj_enemy_fst_bCub,obj_enemy_fst_gnome,obj_enemy_fst_gremloblin,obj_enemy_fst_kBilly,obj_enemy_fst_plaidypus,obj_enemy_fst_qQuail)
	if array_length(global.runemy) > 0 {//runemy is reset with obj_lakeBoat
		enemyCT = array_length(global.runemy)
		enemies = global.runemy
	}
	switch enemyCT {
		case 3://We shouldn't have 3 enemies, but I'll leave this just in case
			global.enemy[1] = instance_create_layer(128,160,"Instances",enemies[1])
			global.enemy[2] = instance_create_layer(512,160,"Instances",enemies[2])
		case 1:
			global.enemy[0] = instance_create_layer(320,160,"Instances",enemies[0])
			break
		case 2:
			global.enemy[0] = instance_create_layer(192,160,"Instances",enemies[0])
			global.enemy[1] = instance_create_layer(448,160,"Instances",enemies[1])
			break
	}
}

music = mus_snowy