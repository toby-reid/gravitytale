/// @description Water
if sprite_index == spr_enemy_cav_scampfire {
	obj_battleCore.text[1] = "You douse Scampfire's flames #with water.&Scampfire whimpers and cowers."
	obj_battleCore.text[0] = "Scampfire may still be able to #reignite itself, so it watches #you carefully."
	sprite_index = spr_enemy_cav_scampfire_legs
	at--
}
else if !spare {
	obj_battleCore.text[1] = "You drown Scampfire in water.&Scampfire hisses as its heat #gets sucked out."
	obj_battleCore.text[0] = "Scampfire can no longer fight #effectively, so it Spares you #until it dries out."
	at--
	spare = true
}
else obj_battleCore.text[1] = "You were going to dump water #on Scampfire, but it's already #pathetic enough."