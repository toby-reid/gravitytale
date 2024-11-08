/// @description Jeer
if instance_exists(obj_enemy_manDan) {
	obj_battleCore.text[1] = "You boo Tyler, but he doesn't #care.&He's excited about the fight."
	obj_battleCore.text[0] = "Maybe you should try to take #his mind off the fight."
}
else if global.enemy_killed[ENEMY.MANLY_DAN] obj_battleCore.text[1] = "You boo Tyler, but he doesn't #care.&He must avenge Manly Dan."
else obj_battleCore.text[1] = "You were going to boo Tyler, #but he doesn't care about #the battle anymore anyway."