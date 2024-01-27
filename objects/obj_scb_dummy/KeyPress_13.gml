if instance_exists(obj_dipper) if obj_dipper.canMove
	if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) or (place_meeting(x,y-2,obj_dipper) and obj_dipper.dir==3) {
		if !variable_global_exists("dummy") {
			obj_soos_ow_6.stage++
			with instance_create_layer(0,0,"Instances",obj_toBattle) {
				music = mus_anticipation
				goto = btl_scb_6_battle
			}
			global.dir = 4
		}
		else if image_index == 0 {//Wax Stans
			with instance_create_layer(160,48,"Instances",obj_textbox) text = ["I don't think now is the best #time to fight the Dummy again."]
		}
		else if image_index == 1 {//Dummy
			with instance_create_layer(160,48,"Instances",obj_textbox) text = ["Look at what you've done #to Soos's precious wax figure."]
		}
		else {//Beheaded
			with instance_create_layer(160,48,"Instances",obj_textbox) text = ["Wax Stans...&He's been...&Murdered!","...you monster."]
		}
	}