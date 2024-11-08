/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save");
if hp <= 0 {//we should never be able to 'spare' her in-battle
	obj_battleCore.lv += lv;
	global.areaKills[? area].killCount++;
	global.player.kills++;
	obj_battleCore.sb += sb;
	global.enemy_killed[ENEMY.WENDY] = true;
	ini_write_real("K",ENEMY.WENDY,ini_read_real("K",ENEMY.WENDY,0)+1);
}
ini_close();