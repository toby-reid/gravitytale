/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv += lv
	global.areaKills[? area].killCount++;
	global.player.kills++;
	obj_battleCore.sb += sb;
	global.enemy_killed[ENEMY.DEPUTY] = true;
	ini_write_real("K",ENEMY.DEPUTY,ini_read_real("K",ENEMY.DEPUTY,0)+1)
	obj_battleEnemy.at += 5
	obj_battleEnemy.check = "Sheriff of Roadkill County.&Devoid of all happiness."
} else {
	global.player.spares++
	obj_battleCore.sb += ceil(sb/2)
	global.enemy_spared[ENEMY.DEPUTY] = true
	ini_write_real("S",ENEMY.DEPUTY,ini_read_real("S",ENEMY.DEPUTY,0)+1)
}
ini_close()