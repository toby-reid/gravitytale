if stage == 0 if instance_exists(obj_dipper) if obj_dipper.canMove
	if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) or (place_meeting(x,y-2,obj_dipper) and obj_dipper.dir==3) {
		obj_dipper.canMove = false
		ini_open("Reset.save")
		if !ini_read_real("K",ENEMY.BLENDIN,false) with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				". . .",
				"huh?",
				"m-my cover has been blown!",
				"memory wipe!",
				". . .",
				"yeah, they are just #baby wipes...",
				"but i-i-i'll make you forget!"
			]
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_blendin
		}
		else with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				". . .",
				"huh?",
				"y-you're the one...",
				"you killed me in a different #timeline, d-didn't you?",
				"ah, time dang it...",
				"but i-i-i'll win this time!"
			]
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_blendin
		}
		ini_close()
		audio_stop_sound(mus_ruins)
		image_xscale = -1
		image_speed = 0
		image_index = 0
		stage++
	}