/// @description Swat
if image_index == 0 obj_battleCore.text[1] = "You tried to call in SWAT #reinforcements, but the target #was too small to attack."
else if !spare {
	obj_battleCore.text[1] = "You quickly swat the Cat. 5 #like a supernatural mosquito."
	obj_battleCore.text[0] = "The Cat. 5 has been flattened #and therefore rendered useless."
	image_yscale = .5
	path_end()
	spare = true
}
else obj_battleCore.text[1] = "...but the target was already #neutralized."