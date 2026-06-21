if !audio_is_playing(sfx_toiletFlush)
if !instance_exists(obj_textbox_old) {
	if instance_exists(obj_dipper) if obj_dipper.canMove {
		if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) {
			if !audio_is_playing(sfx_toiletFlush) {
				with instance_create_layer(160,48,"Instances",obj_textbox_old) {
					text = ["(It's a toilet.)","(Flush?)##       Yes         No"]
					choice[1] = 1
				}
				active = true
			}
			else with instance_create_layer(160,48,"Instances",obj_textbox_old) text = ["(Let's not waste water.&(Wait for the tank to refill.)"]
		}
	}
}
else if active if obj_textbox_old.page == 1 {
	if obj_textbox_old.action[1] == 0 {
		audio_play_sound(sfx_toiletFlush,0,false)
		obj_textbox_old.text[2] = "(Excellent work!&(You successfully flushed a #toilet!)"
		washed = false
	}
	active = false
}