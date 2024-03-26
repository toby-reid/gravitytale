if save == 0 if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
		obj_dipper.canMove = false
		if y > camera_get_view_y(view_camera[0])+140 ybox = 96
		else ybox = 384
		with instance_create_layer(160,ybox/2,"Instances",obj_textbox) {
			text[0] = other.text
			sound[0] = silence
			if global.player[player.runActive] == 2 {
				text[0] = "@ff0000"
				if global.areaKilled[other.loc] < global.areaMax[other.loc] text[0] += string(global.areaMax[other.loc]-global.areaKilled[other.loc])+" left."
				else {
					if global.player[player.mabel] text[0] += "Immolation."
					else text[0] += "Devastation."
				}
			}
		}
		save = 1
		size = 0
		ini_open("Prof.save");
		nm = ini_read_string("Profile","NM","EMPTY");
		lv = ini_read_real("Profile","LV",0);
		time = ini_read_string("Profile","TM","00:00:00");
		rm = ini_read_string("Profile","RM","--");
		ini_close();
		global.player[player.hp] = global.player[player.maxhp]
		audio_play_sound(sfx_heal,0,false)
	}
}