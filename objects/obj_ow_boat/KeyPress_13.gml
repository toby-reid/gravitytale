if active {
	if instance_exists(obj_textbox) {if alarm[0] == -1 if obj_textbox.action[0] == 0 {alarm[0] = 1; global.dir = 0}}
	else active = false
}
else if place_meeting(x,y+2,obj_dipper) if obj_dipper.canMove if obj_dipper.dir == 1 {
	if room == ow_scb_27_dock with instance_create_layer(160,192,"Instances",obj_textbox) {
		text = ["Ride to the Mainland?##       Yes         No"]
		choice = [1]
	}
	else with instance_create_layer(160,192,"Instances",obj_textbox) {
		text = ["Ride to Scuttlebutt Island?##       Yes         No"]
		choice = [1]
	}
	active = true
}