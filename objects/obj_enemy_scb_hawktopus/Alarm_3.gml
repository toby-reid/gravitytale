/// @description Ink
ink++
switch ink {
	case 1:
		obj_battleCore.text[1] = "You try to collect ink from #Hawktopus, but it seems timid."
		obj_battleCore.text[0] = "What did you expect, getting it #from a wild animal?&This isn't Ourscraft."
		break
	case 2:
		obj_battleCore.text[1] = "You try to collect ink again.&Hawktopus gets scared and #drops ink."
		obj_battleCore.text[0] = "Congratulations!&You have startled an #endangered animal."
		spare = true
		break
	default:
		obj_battleCore.text[1] = "Hawktopus is out of ink."
		obj_battleCore.text[0] = "Why would you do this?"
		break
}