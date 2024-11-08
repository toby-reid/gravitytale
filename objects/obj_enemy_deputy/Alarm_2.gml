/// @description Discuss
if !global.enemy_killed[ENEMY.SHERIFF] switch stage {
	case 0:
		obj_battleCore.text[1] = "You were going to start a #discussion, but you have no idea #what to talk about."
		obj_battleCore.text[0] = "Try focusing them both first."
		break
	case 1:
		stage++
		if obj_enemy_sheriff.stage == 1 {
			obj_battleCore.text[1] = "You start up a friendly #conversation with the deputy.&He'd rather not talk to you."
			bubbleText = "BUT WHAT ABOUT YOU, PARTNER?"
			obj_battleCore.text[0] = "Perhaps someone else can hold a #discussion with the deputy."
		}
		else {
			obj_battleCore.text[1] = "You try to start a friendly #conversation with the deputy, #but he's already occupied."
			bubbleText = "LET'S GO ON A VACATION!!"
			obj_enemy_sheriff.bubbleText = "What place have you always wanted to visit??"
			obj_battleCore.text[0] = "They're ready to go, but they #need further persuasion because #reasons."
		}
		break
	default:
		obj_battleCore.text[1] = "...but he's already looking for #further discussion."
		obj_battleCore.text[0] = "Try getting both to talk."
		break
}
else obj_battleCore.text[1] = "You tried to ACT on Durland, #but he does not care anymore."