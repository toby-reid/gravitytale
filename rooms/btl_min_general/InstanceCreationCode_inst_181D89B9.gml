global.battleTimer = 300

if global.areaKills[? AREA.MINES].killCount < global.areaKills[? AREA.MINES].MAX_KILLS {
	var enemyCT = irandom(1) + 1;
	var enemies = array_create_ext(enemyCT, function(_) { return choose(obj_enemy_min_arachnimorph,
                                                                        obj_enemy_min_leprecorn,
                                                                        obj_enemy_min_mockroach,
                                                                        obj_enemy_min_soothsquito,
                                                                        obj_enemy_min_unicorn,
                                                                        obj_enemy_min_zombie); });
    enemies[0] = obj_enemy_min_mockroach;
    enemies[1] = obj_enemy_min_mockroach;
	switch enemyCT {
		case 3://We shouldn't have 3 enemies, but I'll leave this just in case
			global.enemy[1] = instance_create_layer(128,160,"Instances",enemies[1]);
			global.enemy[2] = instance_create_layer(512,160,"Instances",enemies[2]);
			// fallthrough
		case 1:
			global.enemy[0] = instance_create_layer(320,160,"Instances",enemies[0]);
			break;
		case 2:
			global.enemy[0] = instance_create_layer(192,160,"Instances",enemies[0]);
			global.enemy[1] = instance_create_layer(448,160,"Instances",enemies[1]);
			break;
	}
}

music = mus_medium;
