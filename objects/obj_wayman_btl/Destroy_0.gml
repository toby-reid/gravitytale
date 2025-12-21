/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

if (global.player.kills > 0) scr_killedEnemy(ENEMY.WAYMAN);
if (global.player.kills == 0 or global.player.spares > 0) scr_sparedEnemy(ENEMY.WAYMAN);
scr_defeatedWayman();
