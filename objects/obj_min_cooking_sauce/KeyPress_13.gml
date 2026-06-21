if (!instance_exists(obj_textbox_old) and instance_exists(obj_dipper) and obj_dipper.canMove) {
	var dir = obj_dipper.dir;
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3)
    {
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
            if (!obj_min_cookingDate.washed)
            {
                text = ["(You should wash your hands #before handling food.)"];
            }
            else if (obj_min_cookingDate.has_butter and !obj_min_cookingDate.is_butter_dipped)
            {
                text = [
                    "(It's a bowl of Big Boy's #Buffalo Sauce.)",
                    "(Dip the butter?)##       Yes         No"
                ];
                choice = [0, 1];
                other.isActive = true;
            }
            else if (obj_min_cookingDate.has_butter)
            {
                text = [
                    "(It's a bowl of Big Boy's #Buffalo Sauce.)",
                    "(If you dip the butter again, #it will get soggy...&(...somehow.)"
                ];
            }
            else
            {
                text = [
                    "(It's a bowl of Big Boy's #Buffalo Sauce.)",
                    "(It tastes exactly like #buffalos.&(Why do you know that?)"
                ];
            }
		}
	}
}
