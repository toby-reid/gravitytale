/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

global.killed[enemy.wayman] = true
global.spared[enemy.wayman] = true
ini_open("Reset.save")
ini_write_real("C","W",ini_read_real("C","W",0)+1)
ini_close()