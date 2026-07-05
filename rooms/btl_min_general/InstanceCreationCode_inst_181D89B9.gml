global.battleTimer = 300

if global.areaKills[AREA.MINES] < global.MAX_KILLS[AREA.MINES] {
	var enemyCT = irandom(1) + 1;
	var enemies = array_create_ext(enemyCT, function(_) { return choose(obj_enemy_min_arachnimorph,
                                                                        obj_enemy_min_leprecorn,
                                                                        obj_enemy_min_mockroach,
                                                                        obj_enemy_min_soothsquito,
                                                                        obj_enemy_min_unicorn,
                                                                        obj_enemy_min_zombie); });
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

music = mus_medium;
