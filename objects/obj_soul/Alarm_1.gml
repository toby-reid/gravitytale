///@desc Running sprite animation
if global.stage[0] == 3 {
	if global.player[player.mabel] {
		if sprite_index == spr_soulM_run_0 sprite_index = spr_soulM_run_1
		else sprite_index = spr_soulM_run_0
	}
	else {
		if sprite_index == spr_soul_run_0 sprite_index = spr_soul_run_1
		else sprite_index = spr_soul_run_0
	}
	alarm[1] = 10
}