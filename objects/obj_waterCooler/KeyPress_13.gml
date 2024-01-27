if !instance_exists(obj_textbox) {
	if instance_exists(obj_dipper) if obj_dipper.canMove {
		if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) {
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = ["(It's a water cooler.)","(Take a drink?)##       Yes         No"]
				choice[1] = 1
			}
			active = true
		}
	}
}
else if active if obj_textbox.page == 1 if obj_textbox.charCount >= string_length(obj_textbox.text[1]) {
	if obj_textbox.action[1] == 0 obj_textbox.text[2] = "(You took a drink.&(Hydration is important.)"
	else obj_textbox.text[2] = "(You're not going to drink?&(Hydration is important...&(You have a drinking problem.)"
	active = false
}