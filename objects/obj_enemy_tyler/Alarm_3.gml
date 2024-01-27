/// @description Rear
if distracted == 0 {
	if instance_exists(obj_enemy_manDan) {
		obj_battleCore.text[1] = "You alert Tyler to the #"+choose("amazing","adorable","incredible","enthusiastic","baby","manly","llama")+" "+choose("sweater","beaver","fight","club meeting","dolphin","enthusiasm")+".&He gets distracted easily."
		obj_battleCore.text[0] = "Tyler is distracted for a bit."
		distracted = 4
		image_xscale = -2
	}
	else if global.killed[enemy.manlydan] obj_battleCore.text[1] = "You try to distract Tyler, #but he is intent on avenging #Manly Dan."
	else obj_battleCore.text[1] = "You were going to distract, #but he doesn't care about the #battle anymore anyway."
}
else obj_battleCore.text[1] = "You were going to distract #Tyler, but he wasn't paying #attention."