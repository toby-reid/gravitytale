/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv += lv
	global.player[player.kills]++
	obj_battleCore.sb += sb
	global.killed[enemy.deputy] = true
	ini_write_real("K",enemy.deputy,ini_read_real("K",enemy.deputy,0)+1)
	obj_battleEnemy.at += 5
	obj_battleEnemy.check = "Sheriff of Roadkill County.&Devoid of all happiness."
}
else {
	global.player[player.spares]++
	obj_battleCore.sb += ceil(sb/2)
	global.spared[enemy.deputy] = true
	ini_write_real("S",enemy.deputy,ini_read_real("S",enemy.deputy,0)+1)
}
ini_close()