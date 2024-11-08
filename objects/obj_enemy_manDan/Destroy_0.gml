/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv++
	global.areaKills[? area].killCount++;
	global.player.kills++;
	obj_battleCore.sb += sb
	global.enemy_killed[ENEMY.MANLY_DAN] = true
	ini_write_real("K",ENEMY.MANLY_DAN,ini_read_real("K",ENEMY.MANLY_DAN,0)+1)
}
else {
	global.player.spares++
	obj_battleCore.sb += ceil(sb/2)
	global.enemy_spared[ENEMY.MANLY_DAN] = true
	ini_write_real("S",ENEMY.MANLY_DAN,ini_read_real("S",ENEMY.MANLY_DAN,0)+1)
}
ini_close()

obj_battleEnemy.maxhp = 3
obj_battleEnemy.hp = 3