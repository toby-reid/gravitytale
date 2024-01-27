/// @description Compliment
if instance_exists(obj_enemy_tyler) {
	if obj_enemy_tyler.distracted == 0 {
		obj_battleCore.text[1] = "You tell Manly Dan he is very #manly, but he isn't listening #to you."
		obj_battleCore.text[0] = "Tyler is encouraging Manly Dan."
	}
	else switch stage {
		case 0:
		case 1:
			obj_battleCore.text[1] = "You try to compliment Manly #Dan, but he does not care #about your opinions."
			break
		case 2:
			obj_battleCore.text[1] = "You tell Manly Dan he has a #very manly beard.&He takes your opinion to heart."
			obj_battleCore.text[0] = "Manly Dan has warmed up to you #a little.&In a manly way, that is."
			stage++
			act[2] = "Befriend"
			break
		case 3:
			obj_battleCore.text[1] = "You ask Manly Dan if he wants #to be your friend.&He accepts several times."
			obj_battleCore.text[0] = "Manly Dan is now your friend.&A Manfriend, of course."
			stage++
			spare = true
			break
		case 4: obj_battleCore.text[1] = "Manly Dan is already your #friend." break
	}
}
else switch stage {
	case 0:
	case 1:
		obj_battleCore.text[1] = "You try to compliment Manly #Dan, but he does not care #about your opinions."
		break
	case 2:
		obj_battleCore.text[1] = "You tell Manly Dan he has a #very manly beard.&He takes your opinion to heart."
		obj_battleCore.text[0] = "Manly Dan has warmed up to you #a little.&In a manly way, that is."
		stage++
		act[2] = "Befriend"
		break
	case 3:
		obj_battleCore.text[1] = "You ask Manly Dan if he wants #to be your friend.&He accepts several times."
		obj_battleCore.text[0] = "Manly Dan is now your friend.&A Manfriend, of course."
		stage++
		spare = true
		break
	case 4: obj_battleCore.text[1] = "Manly Dan is already your #friend." break
}