if instance_exists(obj_textbox) { with obj_textbox if variable_instance_exists(id,"charCount") {
	if (array_length(segText) > 0) {
		if charCount < string_length(segText[array_length(segText)-1]) other.image_speed = 1
		else other.image_index = 0
	}
}}
else {image_index = 0; image_speed = 0}