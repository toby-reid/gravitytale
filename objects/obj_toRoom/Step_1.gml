/// @description temp - persistency fix
// TODO: Investigate why this is "temp"
if global.toRoom {
	room_persistent = false;
	room_restart();
	global.toRoom = false
}