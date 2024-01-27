/// @description Talk
switch talk {
	case 0: obj_battleCore.text[1] = "You try to talk to Soos.&He looks through you." break
	case 1: obj_battleCore.text[1] = "You ask Soos how he's doing.&He ignores you." break
	case 2: obj_battleCore.text[1] = "Soos doesn't seem to want to #talk right now." break
	default: obj_battleCore.text[1] = "Talking doesn't seem to be #working...&Could anything else work?" break
}
talk++