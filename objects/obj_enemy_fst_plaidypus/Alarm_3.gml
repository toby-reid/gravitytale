/// @description Hat
if hat == 1 {//Fedora
	if global.has_fedora obj_battleCore.text[1] = "You already have that hat...&You didn't really think that #one through, huh?"
	else {
		obj_battleCore.text[1] = "You swapped hats with Perky.&I'm sure he won't mind."
		hat = 2
		global.has_fedora = true
	}
}
else if hat == 2 {//Baseball cap
	obj_battleCore.text[1] = "You returned Perky's cap and #took back your own."
	hat = 1
	global.has_fedora = false
}
else obj_battleCore.text[1] = "How did you plan to take a hat #that's not there?"