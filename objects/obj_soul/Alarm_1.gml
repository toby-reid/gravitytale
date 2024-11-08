///@desc Running sprite animation
if global.stage[0] == 3 {
	switch sprite_index {
		case spr_soulM_run_0: sprite_index = spr_soulM_run_1; break;
		case spr_soulM_run_1: sprite_index = spr_soulM_run_0; break;
		case spr_soul_run_0:  sprite_index = spr_soul_run_1;  break;
		default: sprite_index = spr_soul_run_0; break;
	}
	alarm[1] = 10
}