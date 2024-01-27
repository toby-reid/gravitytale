/// @description Roadkill Grill
if irandom(3) == 0 {
	obj_battleCore.text[1] = "You start grilling up the nearby #"+choose("possom","aardvark","porcupine","raccoon","deer")+" on the road.&Kill Billy loves it!"
	obj_battleCore.text[0] = "Kill Billy is grateful for the #gourmet meal."
	spare = true
}
else {
	obj_battleCore.text[1] = "You try to cook up the nearby #"+choose("possom","aardvark","porcupine","raccoon","deer")+" on the road.&You're really bad at it."
	obj_battleCore.text[0] = "Sometimes, cooking requires #more practice.&Sometimes, it's just luck."
}