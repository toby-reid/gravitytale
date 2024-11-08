/// @description Leave without washing hands?
if instance_exists(obj_dipper) with obj_dipper if place_meeting(x,y+3,obj_toRoom) {
	if !other.washed {
		y -= 2
		dir = 1
		with instance_create_layer(160,48,"Instances",obj_textbox) {
			text = [
				"(Hold on...)",
				"(You're not going to leave #without washing your hands, #are you?)",
				"(You just flushed a toilet.&(You should be more sanitary.)"
			];
		}
	} else audio_stop_sound(sfx_toiletFlush)
}