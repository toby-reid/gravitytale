/// @description Burnpile Style
switch stage {
	case 0:
		obj_battleCore.text[1] = "A gleam in your eyes, you #started a fire...&But there was nothing to burn."
		obj_battleCore.text[0] = "Maybe you can use something #around here?"
		break
	case 1:
		obj_battleCore.text[1] = "A gleam in your eyes, you #burn all the junk.&Kill Billy is devastated."
		obj_battleCore.text[0] = "Kill Billy might have used that #junk sometime in the next 70 #years. How sad."
		stage++
		spare = true
		break
	default:
		obj_battleCore.text[1] = "But there was nothing left to #burn."
		break
}