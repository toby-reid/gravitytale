if !instance_exists(obj_textbox_old) { if instance_exists(obj_dipper) if obj_dipper.canMove {
	if place_meeting(x,y+2,obj_dipper) and obj_dipper.dir == 1 {
		if image_index == 0 with instance_create_layer(160,48,layer,obj_textbox_old) {
			text = other.text
			head = other.head
			for(var i = 0; i <= 12; i++) {font[i] = fnt_sans_gui; sound[i] = tlk_stans}
			choice[10] = 1
			other.stage = 1
		} else if global.enemy_killed[ENEMY.STANS_CAVE] {
			with instance_create_layer(160,48,layer,obj_textbox_old) text = ["(Hm...&(It seems Stans isn't around #right now.)","(Maybe you shouldn't have tried #to kill him.)"]
		} else with instance_create_layer(160,48,layer,obj_textbox_old) text = ["(Hm...&(It seems Stans isn't around #right now.)"]
	} else if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) {
		with instance_create_layer(160,48,layer,obj_textbox_old) text = ["(It's a rickety old stand.&(Looks like it was made from #junkyard wood.)"]
	}
}}
else if stage == 1 with obj_textbox_old {
	if page == 10 { if charCount >= string_length(text[10]) if action[10] == 0 {
		text[11] = "heh, heh...&alright, then, kid..."
		text[12] = "here we go."//head is already good to go
		setMove = false
	}}
	else if page == 12 if charCount >= string_length(text[12]) {
		with other {
			alarm[0] = 5;
			array_push(global.trashCan, id);
		}
	}
}
else if stage == 3 with obj_textbox_old {
	if page == array_length(text)-1 if charCount >= string_length(text[array_length(text)-1]) {
		audio_play_sound(sfx_click,0,false)
		other.stage++
		other.image_index = 1
		setMove = true
	}
}