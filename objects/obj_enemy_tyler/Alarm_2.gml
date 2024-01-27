/// @description Cheer
if instance_exists(obj_enemy_manDan) {
	obj_battleCore.text[1] = "You cheer with Tyler.&Manly Dan's AT is raised #this turn!"
	obj_battleCore.text[0] = "Tyler is influencing Manly Dan.&Maybe there's something else #you can do about him."
	obj_enemy_manDan.encouraged = true
}
else {
	if global.killed[enemy.manlydan] {
		obj_battleCore.text[1] = "You encourage Tyler just to #give up.&That sounds appealing to him..."
		obj_battleCore.text[0] = "Tyler gives up on everything.&Very inspiring."
	}
	else {
		obj_battleCore.text[1] = "You encourage Tyler to leave.&He agrees the fight is no #longer interesting."
		obj_battleCore.text[0] = "Tyler is ready to leave."
	}
	spare = true
}