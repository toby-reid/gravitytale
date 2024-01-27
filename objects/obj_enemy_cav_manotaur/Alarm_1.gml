/// @description Brain Magic
if !spare {
	obj_battleCore.text[1] = "You try to convince Manotaur to #back down."
	obj_battleCore.text[0] = "Manotaur got confused and is now #sparing you instead."
	spare = true
}
else {
	obj_battleCore.text[1] = "But Manotaur was already very #confused, so you decided to #back down yourself."
}