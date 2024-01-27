/// @description Insult
if instance_exists(obj_enemy_tyler) {
	if obj_enemy_tyler.distracted == 0 obj_battleCore.text[1] = "You try to insult Manly Dan, #but he isn't paying attention."
	else if stage <= 1 obj_battleCore.text[1] = "You try to insult Manly Dan, #but he doesn't think your #opinion matters."
	else {obj_battleCore.text[1] = "You tell Manly Dan he should #be called Girlish Dan.&Manly Dan's AT went up by 1!"; at++}
}
else obj_battleCore.text[1] = "You try to insult Manly Dan, #but he is ashamed at your #cowardice."