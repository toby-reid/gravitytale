canMove = true;
image_speed = 0;
menu = [0,0]//[0]: 0 nil, 1 main, 2 items, 3 item action, 4 journal; [1] Item Action
if !variable_global_exists("dir") global.dir = 3
if global.dir < 4 dir = global.dir
else dir = 3
moving = false
fixCollide = 3

if (global.player.mabel) {
	if string_lower(global.player.name) == "waddle" sprite_index = spr_mabdles;
	else sprite_index = spr_mabel;
} else {
	if string_lower(global.player.name) == "lamby" sprite_index = spr_diplamb
	else if global.player.at == AT_DF.NONE sprite_index = spr_dipper
	else if string_lower(global.player.name) == "mason" sprite_index = spr_dipstar
	else sprite_index = spr_diphat
}
if (!variable_global_exists("dip_pos")) global.dip_pos = [];

inventory = []; // TODO: Unused
