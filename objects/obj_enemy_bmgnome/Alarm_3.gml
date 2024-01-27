/// @description Scribe
if act[3] == "Scribe" {
	obj_battleCore.text[1] = "You were about to write out a #contract with the Gnome, but #you thought better."
	if global.player[player.mabel] obj_battleCore.text[0] = "It's probably best to save #marriage for much later."
	else obj_battleCore.text[0] = "It's not a very good idea to #try to outhustle a hustler."
	act[3] = "Script"
	act[2] = "Drip"
	act[1] = "Tip"
}
else if !spare {
	obj_battleCore.text[1] = "You firmly instruct Black #Market Gnome to stick with its #designated script."
	obj_battleCore.text[0] = "It realises it should be #trafficking fairies, not #Queens."
	spare = true
}
else {
	obj_battleCore.text[1] = "You tried to banish the shady #Gnome to the shadow realm, but #that requires FIGHTing."
	obj_battleCore.text[0] = "Stick more with the script, #please.&It's hard to make this work."
}