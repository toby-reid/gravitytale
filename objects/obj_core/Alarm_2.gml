/// @description (old) Load Instance variables

if variable_instance_exists(id,"goto") {
	if room == goto scr_load_inst()
	else {room_persistent = false; room_goto(goto); alarm[2] = 10}
}
else scr_load()