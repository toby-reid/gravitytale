/// @description Desist
if !global.killed[enemy.sheriff] switch stage {
	case 0:
		obj_battleCore.text[1] = "You firmly instruct the deputy #to stop attacking."
		bubbleText = "THAT ALMOST SOUNDS NICE!"
		stage++
		if obj_enemy_sheriff.stage == 0
			obj_battleCore.text[0] = "Durland looks pointedly at #Blubs, awaiting his approval."
		else//other.stage == 1
			obj_battleCore.text[0] = "The two share a nod, but they #don't exactly know what else #to do besides pound you."
		break
	default:
		if obj_enemy_sheriff.stage == 0 {
			obj_battleCore.text[1] = "...but you've already told the #deputy what to do."
			obj_battleCore.text[0] = "Try getting the sheriff on #board."
		}
		else {
			obj_battleCore.text[1] = "...but they'd both already #decided to stop."
			obj_battleCore.text[0] = "They may be seeking an #alternative."
		}
}
else obj_battleCore.text[1] = "You tried to ACT on Durland, #but he does not care anymore."