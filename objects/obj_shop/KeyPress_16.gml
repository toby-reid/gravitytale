if !confirm {
	if stage != 0 and stage < 5 {
		text[0] = msg[0];
		stage = 0
		audio_play_sound(sfx_select,0,false)
		charCount = 0
	}
	else charCount = string_length(text[0])+5
}
else {
	confirm = false
	audio_play_sound(sfx_select,0,false)
}

event_user(1)