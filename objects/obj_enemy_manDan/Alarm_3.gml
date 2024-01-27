/// @description Music
if instance_exists(obj_enemy_tyler) {
	if obj_enemy_tyler.distracted == 0 {
		obj_battleCore.text[1] = "You try to talk to Manly Dan, #but he isn't paying attention."
		obj_battleCore.text[0] = "Tyler is encouraging Manly Dan."
	}
	else switch stage {
		case 0:
			obj_battleCore.text[1] = "You tried to play some heavy #metal, but it seems that's not #his style."
			obj_battleCore.text[0] = "What kind of music might such a #man like?"
			break
		case 1:
			obj_battleCore.text[1] = "You tell Manly Dan the band #Sev'ral Timez is indeed manly.&He agrees wholeheartedly."
			obj_battleCore.text[0] = "Manly Dan will believe #anything you say."
			stage++
			break
		case 2: obj_battleCore.text[1] = "Manly Dan already accepts your #taste in bands.&That isn't his only trait." break
		default: obj_battleCore.text[1] = "Manly Dan does not need to #talk anymore." break
	}
}
else switch stage {
	case 0:
		obj_battleCore.text[1] = "You tried to play some heavy #metal, but it seems that's not #his style."
		obj_battleCore.text[0] = "What kind of music might such a #man like?"
		break
	case 1:
		obj_battleCore.text[1] = "You tell Manly Dan the band #Sev'ral Timez is indeed manly.&He agrees wholeheartedly."
		obj_battleCore.text[0] = "Manly Dan will believe #anything you say."
		stage++
		break
	case 2: obj_battleCore.text[1] = "Manly Dan already accepts your #taste in bands.&That isn't his only trait." break
	default: obj_battleCore.text[1] = "Manly Dan does not need to #talk anymore." break
}