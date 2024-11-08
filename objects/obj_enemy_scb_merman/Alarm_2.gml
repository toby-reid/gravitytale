/// @description Water
bubbleText = "Ah, gracias.";
switch water {
	case 0:
		obj_battleCore.text[1] = "You spray some water on Merman.&He calms down a bit."
		obj_battleCore.text[0] = "Merman is doing slightly #better."
		break
	case 1:
		obj_battleCore.text[1] = "You dump a bucket of water on #Merman.&He stops flopping."
		obj_battleCore.text[0] = "Merman is ready to go."
		spare = true
		break
	case 2:
		obj_battleCore.text[1] = "You perform mouth-to-mouth in #reverse.&Merman is weirded out."
		obj_battleCore.text[0] = "Merman thinks you're weird."
		bubbleText = "Ah... gracias?";
		break
	case 3:
		obj_battleCore.text[1] = "You pour some Jarate on Merman.&You don't know what that is, #do you?"
		obj_battleCore.text[0] = "Merman is disgusted with you."
		bubbleText = "Please... no more.";
		break
	default:
		obj_battleCore.text[1] = "You give Merman more liquid.&He just wants to go."
		obj_battleCore.text[0] = "Merman wants to leave."
		bubbleText = "Please... no more.";
		spare = true
		break
}
water++