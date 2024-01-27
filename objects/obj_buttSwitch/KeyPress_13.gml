if instance_exists(obj_dipper) if obj_dipper.canMove if obj_dipper.dir==1 if place_meeting(x,y+2,obj_dipper) {
	obj_dipper.canMove = false
	if instance_exists(obj_swapButton) if !done audio_play_sound(sfx_select,0,false)
	audio_play_sound(sfx_buttSwitch,0,false)
	image_index++
	alarm[0] = 20
	if !done {
		active = 1
		for(var i = 0; i < instance_number(obj_button); i++) with instance_find(obj_button,i) image_index = 2*floor(image_index/2)
		if instance_exists(obj_swapButton) obj_swapButton.image_index = 0
	}
	for(var i = 0; i < instance_number(obj_rock); i++) with instance_find(obj_rock,i) {x = xstart; y = ystart; image_blend = c_white}
	for(var i = 0; i < instance_number(obj_cav_box); i++) with instance_find(obj_cav_box,i) {x = xstart; y = ystart}
}