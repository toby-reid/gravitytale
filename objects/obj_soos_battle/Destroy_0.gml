/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv = lv
	global.areaKills[? area].killCount++;
	global.player.kills++
	global.enemy_killed[ENEMY.SOOS] = true
	obj_battleCore.sb += sb
	ini_write_real("K",ENEMY.SOOS,ini_read_real("K",ENEMY.SOOS,0)+1)
}
else {
	global.player.spares++
	global.enemy_spared[ENEMY.SOOS] = true
	obj_battleCore.sb += ceil(sb/2)
	ini_write_real("S",ENEMY.SOOS,ini_read_real("S",ENEMY.SOOS,0)+1)
}
ini_close()