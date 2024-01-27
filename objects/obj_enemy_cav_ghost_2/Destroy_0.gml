/// @description Create: name,act[0-3],check,spare,run,hp,maxhp,at,xp,sb,zone
//Alarm[0-3]: Act actions
//Alarm[4]: text bubble (global.stage[0] = 4)
//Alarm[5-6]: Spare/Run actions

if instance_number(obj_enemy_cav_ghost) == 1 {
	global.ghost++
	global.enemy = []
	global.enemy[0] = instance_create_layer(320,120,layer,categories[global.ghost])
	global.stage[0] = 5
}
else obj_battleCore.text[0] = "Prankster 2 has #abandoned its post."