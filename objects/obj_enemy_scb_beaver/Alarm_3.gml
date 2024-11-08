/// @description Smack
if hug > -3 hug--
switch hug {
	case 2:
		obj_battleCore.text[1] = "You smack Beaver when its guard #is down.&This was not Beaver's intention."
		break
	case 1:
		obj_battleCore.text[1] = "You smack Beaver after hugging #it twice.&Not that kind of \"smack\"."
		break
	case 0:
		obj_battleCore.text[1] = "You smack Beaver after hugging #it.&You low-down scoundrel."
		break
	case -1:
		obj_battleCore.text[1] = "You smack Beaver.&Beaver hopes that was an #accident."
		break
	case -2:
		obj_battleCore.text[1] = "You smack Beaver again.&Beaver considers filing a #lawsuit."
		break
	case -3:
		obj_battleCore.text[1] = "You continue to smack Beaver.&You feel lower than the scum #of the earth."
		break
}
obj_battleCore.text[0] = string_concat("PETA repossesses your #",
									   choose("neighbor's","best","nice","lawn","left","grandmother's"),
									   " ",
									   choose("goldfish","toaster","fork","chair","foot","onions"),
									   " to pay for #damages.")
