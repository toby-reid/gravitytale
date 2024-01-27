/// @description soundTime
if stage == 2 alarm[1] = 5
if charCount > 0
	if charCount <= string_length(text)
		if string_copy(text,charCount,1) != " "
			if string_copy(text,charCount,1) != "&"
				if string_copy(text,charCount,1) != "#"
					audio_play_sound(tlk_bill,0,false)