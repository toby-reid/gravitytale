/// @description Encourage
if instance_number(obj_enemy_cav_ghost) == 1 {
	obj_battleCore.text[1] = "You were going to encourage #the other Cat. 2, but there was #no one else to prank."
}
else if instance_find(obj_enemy_cav_ghost,0) == id {
	with instance_find(obj_enemy_cav_ghost,1) {
		if !spare {
			obj_battleCore.text[1] = "You encouraged the Cat. 2 to #prank its brother."
			obj_battleCore.text[0] = "The Cat. 2 has been flipped."
			image_yscale *= -1
			spare = true
		}
		else {
			obj_battleCore.text[1] = "The Cat. 2 has already been #flipped.&He needs no further prankage."
		}
	}
}
else {
	if spare {
		obj_battleCore.text[1] = "The poor Cat. 2 has already been pranked.&Don't push it."
	}
	else {
		obj_battleCore.text[1] = "The Cat. 2 tried to prank its #brother, but it just couldn't #reach."
	}
}