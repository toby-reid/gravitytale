/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

if (global.player.kills  > 0) global.enemy_killed[ENEMY.WAYMAN] = true;
if (global.player.spares > 0) global.enemy_spared[ENEMY.WAYMAN] = true;
ini_open("Reset.save");
ini_write_real("C","W",ini_read_real("C","W",0)+1);
ini_close();