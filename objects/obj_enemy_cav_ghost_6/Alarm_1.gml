/// @description Confirm
if !spare {
	attention++
	if attention == 10 {
		obj_battleCore.text[1] = "You beg the Cat. 6's for more pain.&They feel uncomfortable."
		obj_battleCore.text[0] = "This is too weird, even for #Phantoms of Pain.&They let you go."
		spare = true
	}
	else if attention >= 4 {
		obj_battleCore.text[1] = "You ask the Cat. 6's to rack up #the pain.&They're happy to oblige."
		obj_battleCore.text[0] = "This is getting weird."
	}
	else {
		obj_battleCore.text[1] = "You confirmed having summoned #the Cat. 6's.&"
		if attention == 2 obj_battleCore.text[1] += "They can attack now!"
		else if attention == 3 obj_battleCore.text[1] += "They continue to attack!"
		obj_battleCore.text[0] = "Maybe you can confuse them #to back down somehow..."
	}
}
else obj_battleCore.text[1] = "You were about to summon more #Phantoms of Pain, but you #thought better."