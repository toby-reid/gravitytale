/// @description Talk
tries++
switch tries {
	case 1:
		obj_battleCore.text[1] = "You try talking to Wax Stans.&It gives no response."
		obj_battleCore.text[0] = "Soos gives you a strange look."
		break
	case 2:
		obj_battleCore.text[1] = "You ask Wax Stans how its day #was.&It gives no response."
		obj_battleCore.text[0] = "Soos wonders if you are crazy."
		break
	case 3:
		obj_battleCore.text[1] = "You tell Wax Stans you like #its fez.&It gives no response."
		obj_battleCore.text[0] = "Soos smiles, concerned for #your sanity."
		break
	case 4:
		obj_battleCore.text[1] = "You invite Wax Stans for tea.&It gives no response."
		obj_battleCore.text[0] = "Soos considers consulting a #medical professional."
		break
	case 5:
		obj_battleCore.text[1] = "You ask Wax Stans out on a date.&Soos decides to step in."
		global.dummy = 4
		break
}