if (!instance_exists(obj_textbox) and instance_exists(obj_dipper) and obj_dipper.canMove) {
	var dir = obj_dipper.dir;
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3)
    {
		with instance_create_layer(160,192,"Instances",obj_textbox) {
            if (!obj_min_cookingDate.washed)
            {
                text = ["(You should wash your hands #before handling food.)"];
            }
            else if (obj_min_cookingDate.has_butter)
            {
                text = [
                    "(It's a knife and some other #indeterminate tool.)",
                    "(Chop the butter?)##       Yes         No"
                ];
                choice = [0, 1];
                other.isActive = true;
            }
            else
            {
                text = [
                    "(It's a knife and some other #indeterminate tool.)",
                    "(Unfortunately, they will only #respond to the Chosen One.&(Or exotic butters.)"
                ];
            }
		}
	}
}
