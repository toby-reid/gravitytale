/// @description sound time
if grow == 0
	if charCount <= string_length(segText[array_length(segText)-1])
		if string_copy(segText[segment],floor(charCount),1) != " " and string_copy(segText[segment],floor(charCount),1) != "."
			audio_play_sound(sound[page],0,false)
					
alarm[1] = 4/(charRate[page]/.5)