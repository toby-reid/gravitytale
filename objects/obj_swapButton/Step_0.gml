if instance_exists(obj_buttSwitch) {
	if !place_meeting(x,y,obj_dipper) step = false
	else if !step if !obj_buttSwitch.done {
		if image_index < 2 {
			image_index++
			if image_index == 1 audio_play_sound(sfx_beep,0,false)
			else audio_play_sound(sfx_click,0,false)
			var done = true
			for(var i = 0; i < instance_number(obj_swapButton); i++) 
				if instance_find(obj_swapButton,i).image_index != 1 {done = false; break}
			if done {
				obj_buttSwitch.done = true;
				array_push(global.buttSwitch, room_get_name(room));
			}
		}
		step = true
	}
}