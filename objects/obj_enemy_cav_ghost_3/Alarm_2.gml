///@desc Poison
obj_battleCore.text[1] = "You feed the Cat. 3 some #"+choose("Burger Prince foot lettuce","suspicious stew","poison iocane","apple seeds laced with cyanide")+".&It is weakened severely."
stage++
switch stage {
	case 1:
		obj_battleCore.text[0] = "Cat. 3 tries to get the taste #out of its mouth."
		image_blend = c_silver
		break
	case 2:
		obj_battleCore.text[0] = "Cat. 3 is desperately rinsing #its mouth with Listerine."
		image_blend = c_grey
		break
	case 3:
		obj_battleCore.text[0] = "Cat. 3 is having difficulties #interacting with its #surroundings."
		image_blend = c_dkgrey
		spare = true
		break
	default:
		obj_battleCore.text[1] = "For the first time in its #(un)life, Glutton refuses to #eat any more."
		break
}