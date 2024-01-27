/// @description sound time
if image_alpha == 1 if image_index < 7 if charCount < string_length(text[image_index]) if string_copy(text[image_index],charCount,1) != " " audio_play_sound(tlk_title,0,false)
alarm[0] = 4