/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

ini_open("Reset.save")
if global.killed[enemy.stans_cave] ini_write_real("K",enemy.stans_cave,true)//if they try resetting, he'll be gone.
else {
	global.player[player.spares]++
	global.spared[enemy.stans_cave] = true
	ini_write_real("S",enemy.stans_cave,true)
}
ini_close()