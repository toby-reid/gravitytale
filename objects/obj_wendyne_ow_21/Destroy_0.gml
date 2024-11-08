/// @description take care of dontGo & savepoint
instance_destroy(obj_save);
with instance_create_layer(240,760,layer,obj_save) {
	rmName = "Cave - Wendy";
	text = string_concat("(The looming shadows mark a #battle of the past, ",
						 (global.player.mabel
						     ? "exciting #your imagination"
							 : "filling you #with dedication"),
						 ".)");
	music = mus_wind;
	loc = AREA.CAVES;
}
instance_destroy(obj_dontGo);
if (global.wendyne < 22) global.wendyne = 22;
with inst_toRoom_cav_21 {
	goto = ow_min_00_hotwendy;
	music = mus_wind;
	dir = 0;
}