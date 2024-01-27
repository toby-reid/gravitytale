/// @description Harvest
if !spare obj_battleCore.text[1] = "You try to harvest the Fairy, #but it bites your hand.&That's rather disarming."
else if !harvested {
	obj_battleCore.text[1] = "You harvested some Fairy Dust #off the Fairy.&This may help against horses."
	harvested = true
	image_speed = .5
	global.fairydust++
}
else obj_battleCore.text[1] = "You were going to harvest the #Fairy, but it has no more #Fairy Dust to harvest."