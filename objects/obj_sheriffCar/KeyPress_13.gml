if !instance_exists(obj_textbox) if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) with instance_create_layer(160,192,"Instances",obj_textbox) {
		if other.stage < 4 text = ["(Looks like a beat-up old #sheriff patrol vehicle.)","(The sun's reflection on the #glass prevents you from seeing #inside.)"]
		else if global.spared[enemy.sheriff] and global.spared[enemy.deputy] text = ["(You still can't see inside the #vehicle, but you know they're #not here.)"]
		else if global.spared[enemy.sheriff] text = ["(You still can't see inside the #vehicle, but you can hear soft #weeping for the lost deputy.)"]
		else if global.spared[enemy.deputy] text = ["(You still can't see inside the #vehicle, but you can hear the #deputy's wailing from within.)"]
		else text = ["(You stuffed the bodies back #into the vehicle...&(How much worse can you get?)"]
	}
}