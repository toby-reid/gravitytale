/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if global.enemy_killed[ENEMY.STANS_CAVE] {
	ini_write_real("K",ENEMY.STANS_CAVE,ini_read_real("K",ENEMY.STANS_CAVE,0)+1);
	global.areaKills[? area].killCount++;
	// do not increment global.player.kills - he didn't actually die
} else {
	global.player.spares++
	global.enemy_spared[ENEMY.STANS_CAVE] = true
	ini_write_real("S",ENEMY.STANS_CAVE,ini_read_real("S",ENEMY.STANS_CAVE,0)+1);
}
ini_close()