/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

if global.enemy_killed[ENEMY.STANS_CAVE] {
    scr_killedEnemy(ENEMY.STANS_CAVE);
	// do not increment global.player.kills - he didn't actually die
} else {
	global.player.spares++;
    scr_sparedEnemy(ENEMY.STANS_CAVE);
}
