if stage == 2 {if !instance_exists(obj_textbox) {
	obj_dipper.canMove = false
	obj_buttSwitch.done = true
	image_speed = 1
	sprite_index = spr_soos_r
	speed = 2
	if x >= 160 {
		sprite_index = spr_soos_u
		direction = 90
		if y <= 115 {
			speed = 0
			image_speed = 0
			image_alpha -= .1
			if image_alpha == 0 {obj_dipper.canMove = true; global.soos = 17; instance_destroy()}
		}
	}
}}
else if !instance_exists(obj_textbox) sprite_index = spr_soos_d

if instance_exists(obj_textbox) with obj_textbox if variable_instance_exists(id,"charCount") {
	if(text[0] == "Sup, "+global.player.name+"-dawg?&Did you need anything?#Yes          No" and charCount > 36) or (obj_textbox.text[0] == "Did you need anything?#I want       No,#to leave     nothing." and charCount > 22) {
		segment = array_length(segText)-1
		charCount = string_length(segText[segment])+15
		sound[page] = silence
	}
}