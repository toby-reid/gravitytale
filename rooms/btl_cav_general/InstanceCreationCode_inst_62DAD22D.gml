global.battleTimer = 300

if global.areaKills[AREA.CAVES] < global.MAX_KILLS[AREA.CAVES] {
	var enemyCT = irandom(1) + 1;
	var enemies = array_create_ext(enemyCT, function(_) { return choose(obj_enemy_cav_eyebat_passive,
																		obj_enemy_cav_barfFairy,
																		obj_enemy_cav_geodite,
																		obj_enemy_cav_manotaur,
																		obj_enemy_cav_scampfire); });
	switch enemyCT {
		case 3://We shouldn't have 3 enemies, but I'll leave this just in case
			global.enemy[1] = instance_create_layer(128,160,layer,enemies[1]);
			global.enemy[2] = instance_create_layer(512,160,layer,enemies[2]);
			// fallthrough
		case 1:
			global.enemy[0] = instance_create_layer(320,160,layer,enemies[0]);
			break;
		case 2:
			global.enemy[0] = instance_create_layer(192,160,layer,enemies[0]);
			global.enemy[1] = instance_create_layer(448,160,layer,enemies[1]);
			break;
	}
}
if instance_exists(obj_enemy_cav_manotaur) {with obj_toBattle music = mus_mansong;}

// set music with obj_toBattle