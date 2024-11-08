/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv = lv
	global.areaKills[? area].killCount++;
	global.player.kills++
	obj_battleCore.sb += sb
	ini_write_real("K",ENEMY.BEAVER,true)
	global.enemy_killed[ENEMY.BEAVER] = true
}
else {
	global.player.spares++
	obj_battleCore.sb += ceil(sb/2)
	ini_write_real("S",ENEMY.BEAVER,true)
	global.enemy_spared[ENEMY.BEAVER] = true
}
ini_close()