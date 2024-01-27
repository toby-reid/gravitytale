/// @description Fixing Room Persistency
if room == goto {
	room_persistent = false
	room_goto(rm_gameover)
	alarm[0] = 60
}
else alarm[2] = 1