/// @description Burn
switch stage {
	/*case 0:
		obj_battleCore.text[1] = "You burned off a little of #Beard Cub's hair.&It grows back immediately."
		obj_battleCore.text[0] = "Beard Cub's movements have slowed #a bit."
		stage++
		break*/
	case 1:
	case 2:
		obj_battleCore.text[1] = "You burned off Beard Cub's #hair.&Much faster than shaving."
		obj_battleCore.text[0] = "Beard Cub's beard grows back #in 3 turns, much slower than a #mature Beard."
		stage = 3
		sprite_index = spr_enemy_fst_bCub_shaved
		spare = true
		grow = 4
		break
	case 3: obj_battleCore.text[1] = "There is no more hair for you #to burn."
}