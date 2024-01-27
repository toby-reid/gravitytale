/// @description Ham bone
switch stage {
	case 0:
		obj_battleCore.text[1] = "You try to toss Gobblewonkie a #ham bone, but it is too fixated on #your hands."
		obj_battleCore.text[0] = "Maybe you can use those hands for #something else?"
		break
	case 1:
		obj_battleCore.text[1] = "You toss Gobblewonkie a ham bone.&It gobbles it up, very wonkily."
		obj_battleCore.text[0] = "Gobblewonkie is no longer hungry #for hands."
		spare = true
		stage++
		break
	default:
		obj_battleCore.text[1] = "You toss a ham bone at Gobblewonkie.&It is too full to eat, and the bone #just hits it in the head."
		break
}