/// @description Hat
if !variable_global_exists("hat") global.hat = false
if hat == 1 {//Fedora
	if global.hat obj_battleCore.text[1] = "You already have that hat...&You didn't really think that #one through, huh?"
	else {
		obj_battleCore.text[1] = "You swapped hats with Perky.&I'm sure he won't mind."
		hat = 2
		global.hat = true
	}
}
else if hat == 2 {//Baseball cap
	obj_battleCore.text[1] = "You returned Perky's cap and #took back your own."
	hat = 1
	global.hat = false
}
else obj_battleCore.text[1] = "How did you plan to take a hat #that's not there?"