if !variable_global_exists("trashCan") global.trashCan = []
var inst = false;
for(var i = 0; i < array_length(global.trashCan); i++) if global.trashCan[i] == room {
	instance_destroy(id,false)
	inst = true
	break
}
if !inst {
	with obj_dipper {
		canMove = false
		image_angle = 90
		image_index = 0
		dir = 0
	}
	alarm[0] = 120
	global.dir = 0
}