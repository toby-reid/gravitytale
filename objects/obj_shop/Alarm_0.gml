///@desc Left Text
charCount++
alarm[0] = 2

if stage == 0 or stage >= 5 {
	var char = string_copy(text[0],charCount,1)
	if(char == "#") {charCount++; char = string_copy(text[0],charCount,1)}//event_perform(ev_alarm,0)
	else if(char == ",") alarm[0] = 8
	else if string_copy(text[0],charCount+1,1) == "&" alarm[0] = 20
	if (charCount <= string_length(text[0]))
		if(charCount%2 == 0) 
			audio_play_sound(tlk_default,0,false)
}