global.battleTimer = 300

if global.areaKilled[area.scuttlebutt] < global.areaMax[area.scuttlebutt] {
	randomize()//Just for testing purposes
	var enemyCT = irandom(1)+1
	var enemies = []
	for(var i=0;i<enemyCT;i++) enemies[i] = choose(obj_enemy_scb_beaver,obj_enemy_scb_cowl,obj_enemy_scb_gobbie,obj_enemy_scb_hawktopus,obj_enemy_scb_merman,obj_enemy_scb_sDuck)
	if array_length(global.runemy) > 0 {
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
else if global.player[player.spares]==0 and !global.killed[enemy.soos] {//Set here, obj_core, obj_save
	global.player[player.runActive] = 2
	scr_genoMusic()
}//Genocide Mode