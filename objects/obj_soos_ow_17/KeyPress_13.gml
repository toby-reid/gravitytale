if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
		switch stage {
			case 0:
				with instance_create_layer(160,192,"Instances",obj_textbox) {
					text = [
						"Sup, "+global.player[player.name]+"-dawg?&Did you need anything?#Yes          No",
						"Nothing, right?&Cool, go explore!"
					]
					head = [spr_soos_face_happy,spr_soos_face_happy_side]
					sound = [tlk_soos,tlk_soos]
					choice[0] = 1
				}
				stage++
			break
			case 1:
				with instance_create_layer(160,192,"Instances",obj_textbox) {
					text = ["Did you need anything?#I want       No,#to leave     nothing."]
					head = [spr_soos_face_happy,spr_soos_face_disappoint,spr_soos_face_disappoint_side]
					sound = [tlk_soos,tlk_soos,tlk_soos]
					choice = [1]
				}
			break
		}
		if dir == 0 sprite_index = spr_soos_l
		else if dir == 2 sprite_index = spr_soos_r
	}
}
else if instance_exists(obj_textbox) if string_copy(obj_textbox.text[0],1,1)=="D" if obj_textbox.action[0] == 0 {
	obj_textbox.text = ["",". . .","Please wait here.&I'll be back in a moment."]
	stage++
}