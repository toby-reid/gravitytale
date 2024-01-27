/// @description Moisturise
if spare {
	if hp == 1 obj_battleCore.text[1] = "You try to moisturise Eyebat.&It's too dry from the stress #of low HP."
	else obj_battleCore.text[1] = "You try to moisturise Eyebat.&I don't know wetter you forgot, #but its eye is already moist."
}
else {
	spare = true
	obj_battleCore.text[1] = "You try to moisturise Eyebat.&Iris you'd done that sooner, #but white now is okay too."
	obj_battleCore.text[0] = "Let's make the moist of this #situation.&Not with tears though."
}