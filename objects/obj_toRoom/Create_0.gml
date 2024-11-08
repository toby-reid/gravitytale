alpha = 1;
alarm[0] = 1;
//dir = 0//Change at creation: 0 right, 1 up, 2 left, 3 down
//num = 0//Change if multiple in a room with same dir or it sends you to room with mult same dir
//music = noone//Change if changing music here
if !variable_global_exists("toRoom_num") global.toRoom_num = 0;
if !variable_global_exists("teleport") global.teleport = false;
if !variable_global_exists("dir") global.dir = 0;
///@desc goto, dir, (poss)num, (poss)music, (poss)door
setPers = room_persistent;