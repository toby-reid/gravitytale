for(var i = 0; i < array_length(global.trashCan); i++) if global.trashCan[i] == trashCan {
	event_user(0)
	instance_destroy()
	break
}