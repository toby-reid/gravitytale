if alarm[0] == -1 if alarm[1] == -1 if vspeed != 0 if y <= obj_dipper.y {
	vspeed = 0
	alarm[2] = 60
}

if (global.killed[enemy.sheriff] and image_index==0) or (global.killed[enemy.deputy] and image_index==1)
	instance_destroy()
else if (global.spared[enemy.sheriff] or global.spared[enemy.deputy]) if !instance_exists(obj_textbox) if alarm[4] == -1 {
	object_index.hspeed = -4 + 3*instance_number(object_index)
	alarm[4] = 390 - 130*instance_number(object_index)
}