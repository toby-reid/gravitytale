canMove = true
//barbell = 0
image_speed = 0
menu = [0,0]//[0]: 0 nil, 1 main, 2 items, 3 item action, 4 journal; [1] Item Action
if !variable_global_exists("dir") global.dir = 3
if global.dir < 4 dir = global.dir
else dir = 3
moving = false
fixCollide = 3
//global.player[player.mabel] = true

if string_lower(global.player[player.name]) == "lamby" sprite_index = spr_diplamb
else if global.player[player.nyarf] < 2 sprite_index = spr_dipper
else if string_lower(global.player[player.name]) == "mason" sprite_index = spr_dipstar
else sprite_index = spr_diphat
if(!variable_global_exists("dip_pos")) global.dip_pos = [];