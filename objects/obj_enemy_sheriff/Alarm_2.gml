/// @description Discuss
if !global.killed[enemy.deputy] switch stage {
	case 0:
		obj_battleCore.text[1] = "You were going to start a #discussion, but you have no idea #what to talk about."
		obj_battleCore.text[0] = "Try focusing them both first."
		break
	case 1:
		stage++
		if obj_enemy_deputy.stage == 1 {
			obj_battleCore.text[1] = "You were about to speak up to #the sheriff, but he won't talk #to the convicted."
			bubbleText = "I plead the fifth. ... Wait, that's you."
			obj_battleCore.text[0] = "Perhaps someone else can hold a #discussion with the sheriff."
		}
		else {
			obj_battleCore.text[1] = "You try to start a friendly #conversation with the sheriff, #but he's already occupied."
			obj_enemy_deputy.bubbleText = "LET'S GO ON A VACATION!!"
			bubbleText = "What place have you always wanted to visit??"
			obj_battleCore.text[0] = "They're ready to go, but they #need further persuasion because #reasons."
		}
		break
	default:
		obj_battleCore.text[1] = "...but he's already looking for #further discussion."
		obj_battleCore.text[0] = "Try getting both to talk."
		break
}
else obj_battleCore.text[1] = "You tried to ACT on Sheriff #Blubs, but he has abandoned #care."