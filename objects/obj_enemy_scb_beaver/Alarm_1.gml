/// @description Hug
if hug < 3 hug++
switch hug {
	case -2:
		obj_battleCore.text[1] = "You try to hug Beaver, #but it is too sore from #your beatings."
		obj_battleCore.text[0] = "Beaver is feeling slightly #better since you are being #nicer."
		break
	case -1:
		obj_battleCore.text[1] = "You hug Beaver.&It is shocked you had a change #of heart."
		obj_battleCore.text[0] = "Beaver seems hopeful."
		break
	case 0:
		obj_battleCore.text[1] = "You hug Beaver.&It is relieved you are not #going to hit it."
		obj_battleCore.text[0] = "Beaver hopes you are having a #new beginning."
		break
	case 1:
		obj_battleCore.text[1] = "You hug Beaver.&It appreciates your kindness."
		obj_battleCore.text[0] = "Beaver is satisfied with you."
		break
	case 2:
		obj_battleCore.text[1] = "You hug Beaver again.&It finds your lack of personal #space disturbing."
		obj_battleCore.text[0] = "You feel lucky Beaver does not #have disease."
		break
	case 3:
		obj_battleCore.text[1] = "You hug Beaver yet again.&Beaver feels very #uncomfortable."
		obj_battleCore.text[0] = "I think you should leave Beaver #alone."
		break
}