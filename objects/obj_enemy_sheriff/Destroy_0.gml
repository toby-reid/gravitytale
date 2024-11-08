/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if hp <= 0 {
	obj_battleCore.lv += lv
	global.areaKills[? area].killCount++;
	global.player.kills++;
	obj_battleCore.sb += sb
	global.enemy_killed[ENEMY.SHERIFF] = true;
	ini_write_real("K",ENEMY.SHERIFF,ini_read_real("K",ENEMY.SHERIFF,0)+1)
	obj_battleEnemy.at += 5
	obj_battleEnemy.check = "Best of friends with the Sheriff.&At least, he was."
}
else {
	global.player.spares++
	obj_battleCore.sb += ceil(sb/2)
	global.enemy_spared[ENEMY.SHERIFF] = true
	ini_write_real("S",ENEMY.SHERIFF,ini_read_real("S",ENEMY.SHERIFF,0)+1)
}
ini_close()