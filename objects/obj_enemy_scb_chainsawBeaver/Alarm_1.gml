/// @description Hug
switch stage {
	case 0: case 1:
		obj_battleCore.text[1] = "You tried to approach Beaver, #but got hurt in the process."
		obj_battleCore.text[0] = "Try stopping the chainsaw #first."
		audio_play_sound(sfx_damageTaken,0,false)
		global.player.hp -= 2 * (2 - stage);
		break
	case 2:
		obj_battleCore.text[1] = "You hug Beaver.&Remember not to do this to #actual beavers."
		obj_battleCore.text[0] = "Beaver is done attacking."
		stage++
		spare = true
		break
	case 3: obj_battleCore.text[1] = "Beaver is done attacking.&Perhaps you should just walk #away." break
}