/// @description Dream
obj_battleCore.text[1] = "You go deeper into your dreams.&"
at -= 3
switch at {
	case 6:
		obj_battleCore.text[1] += "The Cat. 9 follows you into the #dream within a dream."
		obj_battleCore.text[0] = "The Cat. 9 was weakened due to #this being more of your dream, #not its creation."
		break
	case 3:
		obj_battleCore.text[1] += "The Cat. 9 digs its way into #the deepslate of your dream."
		obj_battleCore.text[0] = "The Cat. 9 is having troubles #digging with the tools at hand.&Literally."
		break
	case 0:
		obj_battleCore.text[1] += "The Cat. 9 has hit bedrock.&...see what I did there?"
		spare = true
		break
}