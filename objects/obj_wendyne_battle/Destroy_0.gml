/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save");
if hp <= 0 {//we should never be able to 'spare' her in-battle
	obj_battleCore.lv += lv;
	global.areaKilled[zone]++;
	global.player[player.kills]++;
	obj_battleCore.sb += sb;
	global.killed[enemy.wendy] = true;
	ini_write_real("K",enemy.wendy,ini_read_real("K",enemy.wendy,0)+1);
}
ini_close();