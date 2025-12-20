/// @description Let Dipper through!
instance_destroy(inst_collide_min_00);
with inst_toRoom_min_00 {
	goto = ow_cav_21_howlingWind;
	dir = 3;
	music = mus_wind;
}
if (global.wendy < 23) global.wendy = 23;
