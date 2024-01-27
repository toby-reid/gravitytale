/// @description Junkyard Reward
switch stage {
	case 0:
		obj_battleCore.text[1] = "You pretend it rhymes.&Kill Billy doesn't notice you #taking its junk."
		obj_battleCore.text[0] = "One man's junk is another's...                       #junk."
		stage++
		break
	default:
		obj_battleCore.text[1] = "You pretend it rhymes.&There wasn't any more junk #to take anyway."
		break
}