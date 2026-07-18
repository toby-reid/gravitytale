/// @description Harvest
if !spare obj_battleCore.text[1] = "You try to harvest Barf Fairy, #but it bites your hand.&That's gross.."
else if !harvested {
	obj_battleCore.text[1] = "You harvested some Fairy Dust #off the Fairy.&This may help against horses."
	harvested = true
	scr_get_item(ITEM_INDEX.FAIRY_DUST);
}
else obj_battleCore.text[1] = "You were going to harvest Barf #Fairy, but it has no more #Fairy Dust to harvest."