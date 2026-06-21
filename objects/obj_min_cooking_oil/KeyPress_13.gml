if (!instance_exists(obj_textbox_old) and instance_exists(obj_dipper) and obj_dipper.canMove) {
	var dir = obj_dipper.dir;
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3)
    {
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
            if (!obj_min_cookingDate.washed)
            {
                text = ["(You should wash your hands #before handling food.)"];
            }
            else if (obj_min_cookingDate.has_butter and !obj_min_cookingDate.is_butter_fried)
            {
                text = [
                    "(It's a bottomless well of #boiling oil.)",
                    "(Dip the butter?)##       Yes         No"
                ];
                choice = [0, 1];
                other.isActive = true;
            }
            else if (obj_min_cookingDate.has_butter)
            {
                text = [
                    "(It's a bottomless well of #boiling oil.)",
                    "(Perhaps^^--and dare I say #it?--^^you have enough oil #for now.)"
                ];
            }
            else
            {
                text = [
                    "(It's a bottomless well of #boiling oil.)",
                    "(You were going to shove in #your hand, but then you had a #better idea.)"
                ];
            }
		}
	}
}
