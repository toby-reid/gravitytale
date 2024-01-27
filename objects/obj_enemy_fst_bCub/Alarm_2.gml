/// @description Shave
switch stage {
	//case 0: obj_battleCore.text[1] = "You tried to shave Beard Cub, #but its hair is too long to #approach." break
	case 1:
		obj_battleCore.text[1] = "You managed to shave off a part #of Beard Cub."
		obj_battleCore.text[0] = "The other half of Beard Cub #remains."
		stage++
		break
	case 2:
		obj_battleCore.text[1] = "You finished shaving Beard Cub."
		obj_battleCore.text[0] = "You plant the shavings in a #cylindrical container with soil.&Are you now a hairy potter?"
		stage++
		sprite_index = spr_enemy_fst_bCub_shaved
		spare = true
		grow = 4
		break
	case 3: obj_battleCore.text[1] = "There is nothing left to shave #on Beard Cub.&Perhaps you should've CUT back." break
}