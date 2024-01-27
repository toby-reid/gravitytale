/// @description Dismiss
if !global.killed[enemy.deputy] switch stage {
	case 0:
	case 1:
		obj_battleCore.text[1] = "You try to tell the sheriff to #leave, but he won't listen to a #criminal."
		obj_battleCore.text[0] = "Seems he's not ready for that #just yet."
		break
	case 2:
		stage++
		if obj_enemy_deputy.stage == 2 {
			obj_battleCore.text[1] = "You tell the sheriff he's free #to go.&He awaits his deputy's response."
			bubbleText = "Together on 3: 1... 2..."
			obj_battleCore.text[0] = "You're almost there."
		}
		else {
			obj_battleCore.text[1] = "You tell the sheriff he's free #to go.&He can't wait."
			bubbleText = "Silly Water Fun Slides in Grand Lakes, Michigan!"
			obj_enemy_deputy.bubbleText = "SILLY WATER FUN SLIDES IN GRAND LAKES, MICHIGAN!"
			spare = true
			obj_enemy_deputy.spare = true
			obj_battleCore.text[0] = "They're finally ready to go...&What a nightmare."
		}
		break
	default:
		obj_battleCore.text[1] = "...but he's already been #convinced.&Don't waste more time here."
		obj_battleCore.text[0] = "Let's get this over with."
		break
}
else obj_battleCore.text[1] = "You tried to ACT on Sheriff #Blubs, but he has abandoned #care."