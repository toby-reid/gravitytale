/// @description dir: where we're chasing
alarm[0] = 60;
switch direction {
	case 0:   sprite_index = spr_wendyne_h_r; break;
	case 90:  sprite_index = spr_wendyne_h_u; break;
	case 180: sprite_index = spr_wendyne_h_l; break;
	case 270: sprite_index = spr_wendyne_h_d; break;
}
image_speed = 0;