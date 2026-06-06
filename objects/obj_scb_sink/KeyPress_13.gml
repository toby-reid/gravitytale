if !instance_exists(obj_textbox) {
	if instance_exists(obj_dipper) if obj_dipper.canMove {
		var dir = obj_dipper.dir
		if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
			with instance_create_layer(160,48,"Instances",obj_textbox) {
				text = ["(It's a sink.)","(Wash your hands?)##       Yes         Yes"]
				choice[1] = 1
			}
			active = true
		}
	}
} else if active if obj_textbox.page == 1 {
	obj_textbox.text[2] = "(Sanitization is important.)"
    if (washed_checker != noone and instance_exists(washed_checker))
    {
        washed_checker.washed = true;
    }
	active = false
}
