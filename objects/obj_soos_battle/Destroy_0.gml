/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv = lv
	global.player[player.kills]++
	global.killed[enemy.soos] = true
	obj_battleCore.sb += sb
	ini_write_real("K",enemy.soos,ini_read_real("K",enemy.soos,0)+1)
}
else {
	global.player[player.spares]++
	global.spared[enemy.soos] = true
	obj_battleCore.sb += ceil(sb/2)
	ini_write_real("S",enemy.soos,ini_read_real("S",enemy.soos,0)+1)
}
ini_close()