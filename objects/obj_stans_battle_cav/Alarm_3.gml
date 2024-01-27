/// @description Fishing
bubbleText = choose("something's fishy here...","water you docking aboat?","the guys at the lodge don't \"like\" or \"trust\" me")
index = spr_stans_head_sly
switch stage {
	case 1:
		obj_battleCore.text[1] = "You offer to go fishing with #Grunkle Stans.&He prepares the joke book."
		obj_battleCore.text[0] = "Grunkle Stans can't find his #joke book.&Maybe you have some to share?"
		break
	case 2:
		obj_battleCore.text[1] = "You offer to go fishing with #Grunkle Stans.&His joke repertoire isn't ready."
		obj_battleCore.text[0] = "Grunkle Stans is missing his #joke book.&Try reading him another joke..."
		break
	case 3:
		obj_battleCore.text[1] = "You offer to go fishing with #Grunkle Stans.&He is hesitant to go."
		obj_battleCore.text[0] = "Maybe he'll go with you if he #likes you enough.&...Not in that way."
		break
	case 4:
		obj_battleCore.text[1] = "You offer to go fishing with #Grunkle Stans.&He loves the idea."
		obj_battleCore.text[0] = "Grunkle Stans is ready to stop #the battle."
		stage++
		spare = true
		break
	default:
		obj_battleCore.text[1] = "You offer to go fishing with #Grunkle Stans.&He already knows."
		break
}