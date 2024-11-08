if !instance_exists(obj_textbox) if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	var ybox = (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
		with instance_create_layer(160,ybox,"Instances",obj_textbox) {
			text = other.text
			font = other.font
			sound = other.sound
			charRate = other.charRate
			choice = other.choice
		}
	}
}