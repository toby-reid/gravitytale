if !instance_exists(obj_textbox_old) { if instance_exists(obj_dipper) if obj_dipper.canMove {
	var ybox = (y > 140) ? 48 : 192;
	if (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) {
		if image_index == 0 with instance_create_layer(160,ybox,"Instances",obj_textbox_old) {
			text = other.text
			head = other.head
			font = other.font
			sound = other.sound
			other.active = true
		}
		else with instance_create_layer(160,ybox,"Instances",obj_textbox_old) text = ["(Hm...&(Looks like stans is gone #right now.)"]
	}
}}
else if active if obj_textbox_old.page == array_length(obj_textbox_old.text)-1 if obj_textbox_old.charCount >= string_length(obj_textbox_old.text[array_length(obj_textbox_old.text)-1]) {
	image_index++
	active = false
	audio_play_sound(sfx_click,0,false)
	array_push(global.trashCan, id);
}