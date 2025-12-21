/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

if instance_number(obj_enemy_cav_ghost) == 1 {
	global.ghost++
	global.player.spares++;
    scr_sparedEnemy(ENEMY.GHOSTS);
	room_persistent = false
}