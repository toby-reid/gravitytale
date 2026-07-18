/// @description Study
if !global.studied_hawktopus {
	obj_battleCore.text[1] = "You study its eating habits.&Hawktopus eats...       &Beef jerkey and toffee peanuts?"
	obj_battleCore.text[0] = "Hawktopus is surprised someone #studied it."
	global.studied_hawktopus = true
}
else obj_battleCore.text[1] = "You try to study something else #about Hawktopus, but there is #nothing else special about it."