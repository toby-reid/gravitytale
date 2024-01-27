/// @description Hide
if !hidden {
	obj_battleCore.text[1] = "You hide from Gremloblin.&It gets distracted with #something else."
	obj_battleCore.text[0] = "Gremloblin is completely #distracted.&Might want to slink away now."
	spare = true
	hidden = true
}
else obj_battleCore.text[1] = "You are already hidden from #Gremloblin's view.&You don't need to hide more."