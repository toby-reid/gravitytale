/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv++
	global.areaKilled[zone]++
	global.player[player.kills]++
	obj_battleCore.sb += sb
	global.killed[enemy.manlydan] = true
	ini_write_real("K",enemy.manlydan,ini_read_real("K",enemy.manlydan,0)+1)
}
else {
	global.player[player.spares]++
	obj_battleCore.sb += ceil(sb/2)
	global.spared[enemy.manlydan] = true
	ini_write_real("S",enemy.manlydan,ini_read_real("S",enemy.manlydan,0)+1)
}
ini_close()

obj_battleEnemy.maxhp = 3
obj_battleEnemy.hp = 3