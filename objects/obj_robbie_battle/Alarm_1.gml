/// @description Music
switch stage {
	case 0: case 1: obj_battleCore.text[1] = "You ask Robbie to play you #something, but he's too good #for personal concerts." break
	case 2:
		obj_battleCore.text[1] = global.player.mabel
			? "Robbie begins singing from the #bottom ventricles of his heart.&You brace for impact..."
			: "Robbie is completely distracted #by that name and plays his #self-written song for her...";
		obj_battleCore.text[0] = "You try to applaud, #but it was too awful to bear.&At least Robbie is content."
		stage++
		spare = true
		break
	default: obj_battleCore.text[1] = "You were going to ask Robbie #for an encore, but you don't #need more bleeding ears today."; stage++ break
}