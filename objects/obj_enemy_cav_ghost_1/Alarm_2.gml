/// @description Ignore
if attention > 0 attention--
obj_battleCore.text[1] = choose("You look right through Cat. 1.&Literally.","You check your calendar to see #your next appointment.","You thought you saw something, #but it was probably just the #wind.","You press \"Mark as Read\" #without opening the message.","Oh, did you ACT this turn?&I didn't notice.")
switch attention {
	case 0:
		obj_battleCore.text[0] = "Cat. 1 has grown tired of #fighting for your attention."
		spare = true
		break
	case 1: obj_battleCore.text[0] = "Cat. 1 is desperately trying #to get your love and affection." break
	case 2: obj_battleCore.text[0] = "Cat. 1 waves its arms #frantically." break
	default: obj_battleCore.text[0] = "Cat. 1 seems more dejected.&Keep ignoring it and it will #disappear." break
}