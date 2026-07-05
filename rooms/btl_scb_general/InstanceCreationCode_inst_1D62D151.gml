global.battleTimer = 300

if global.areaKills[AREA.SCUTTLEBUTT] < global.MAX_KILLS[AREA.SCUTTLEBUTT] {
	var enemyCT = irandom(1) + 1;
	var enemies = array_create_ext(enemyCT, function(_) { return choose(obj_enemy_scb_beaver,
																		obj_enemy_scb_cowl,
																		obj_enemy_scb_gobbie,
																		obj_enemy_scb_hawktopus,
																		obj_enemy_scb_merman,
																		obj_enemy_scb_sDuck) });
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
else if global.player.spares == 0 and !global.enemy_killed[ENEMY.SOOS] {
	global.player.genocide = RUN.ACTIVE;
	scr_genoMusic();
}

music = mus_ruins;