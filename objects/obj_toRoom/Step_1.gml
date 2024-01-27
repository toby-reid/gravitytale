/// @description temp - persistency fix
if variable_global_exists("toRoom") if global.toRoom {room_persistent = false; room_restart(); global.toRoom = false}