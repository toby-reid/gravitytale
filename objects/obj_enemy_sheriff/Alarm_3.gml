/// @description Desist
if !global.enemy_killed[ENEMY.DEPUTY] switch stage {
	case 0:
		obj_battleCore.text[1] = "You suggest the sheriff stops #attacking."
		bubbleText = "Hmm... now you onto somethin', kid."
		stage++
		if obj_enemy_deputy.stage == 0
			obj_battleCore.text[0] = "Blubs deeply considers your #notion, but he refuses to act #without his partner."
		else//other.stage == 1
			obj_battleCore.text[0] = "The two share a nod, but they #don't exactly know what else #to do besides pound you."
		break
	default:
		if obj_enemy_deputy.stage == 0 {
			obj_battleCore.text[1] = "...but you've already suggested #the sheriff's next move."
			obj_battleCore.text[0] = "Try getting the deputy on board."
		}
		else {
			obj_battleCore.text[1] = "...but they'd both already #decided to stop."
			obj_battleCore.text[0] = "They may be seeking an #alternative."
		}
}
else obj_battleCore.text[1] = "You tried to ACT on Sheriff #Blubs, but he has abandoned #care."