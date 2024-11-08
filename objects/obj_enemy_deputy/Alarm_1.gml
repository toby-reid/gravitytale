/// @description Dismiss
if !global.enemy_killed[ENEMY.SHERIFF] switch stage {
	case 0:
	case 1:
		obj_battleCore.text[1] = "You firmly tell the deputy to #leave.&He is too confused to move."
		obj_battleCore.text[0] = "Seems he's not ready for that #just yet."
		break
	case 2:
		stage++
		if obj_enemy_sheriff.stage == 2 {
			obj_battleCore.text[1] = "You firmly tell the deputy it's #time to leave.&He awaits his partner's answer."
			bubbleText = "OH! I KNOW THIS ONE!! IT'S--"
			obj_battleCore.text[0] = "You're almost there."
		}
		else {
			obj_battleCore.text[1] = "You firmly tell the deputy it's #time to leave.&He can't wait."
			bubbleText = "SILLY WATER FUN SLIDES IN GRAND LAKES, MICHIGAN!"
			obj_enemy_sheriff.bubbleText = "Silly Water Fun Slides in Grand Lakes, Michigan!"
			spare = true
			obj_enemy_sheriff.spare = true
			obj_battleCore.text[0] = "They're finally ready to go...&What a nightmare."
		}
		break
	default:
		obj_battleCore.text[1] = "...but he's already been #convinced.&Don't waste more time here."
		obj_battleCore.text[0] = "Let's get this over with."
		break
}
else obj_battleCore.text[1] = "You tried to ACT on Durland, #but he does not care anymore."