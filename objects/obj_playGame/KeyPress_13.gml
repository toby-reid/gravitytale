if instance_exists(obj_dipper) if obj_dipper.canMove {
	if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) or (place_meeting(x,y-2,obj_dipper) and obj_dipper.dir==3) {
		active = true
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text[0] = other.text[0]
			choice = [1]
		}
	}
}
else if active {
	if instance_exists(obj_textbox_old) and goto != room {
		if obj_textbox_old.action[0] == 0 {//Yes
			instance_destroy(obj_textbox_old)
			with instance_create_layer(0,0,"Instances",obj_toBattle) {
				goto = other.goto
				music = other.music
				dest = 2
			}
		}
		else active = false
	}
	else active = false
}