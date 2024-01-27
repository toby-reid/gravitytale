/// @description Study
if !global.study {
	obj_battleCore.text[1] = "You study its eating habits.&Hawktopus eats...       &Beef jerkey and toffee peanuts?"
	obj_battleCore.text[0] = "Hawktopus is surprised someone #studied it."
	global.study = true
}
else obj_battleCore.text[1] = "You try to study something else #about Hawktopus, but there is #nothing else special about it."