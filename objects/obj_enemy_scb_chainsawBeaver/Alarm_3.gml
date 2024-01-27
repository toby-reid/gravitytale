/// @description Siphon
switch stage {
	case 0:
		obj_battleCore.text[1] = "You siphon some gas from the #chainsaw."
		obj_battleCore.text[0] = "The chainsaw is still moving.&There must still be gas."
		stage++
		break
	case 1:
		obj_battleCore.text[1] = "You siphon the remaining gas #from the chainsaw."
		obj_battleCore.text[0] = "The chainsaw has stopped moving.&Perhaps now you can get close."
		stage++
		break
	default: obj_battleCore.text[1] = "There is no more gas in the #chainsaw." break
}