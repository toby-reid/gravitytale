/// @description charCount++
if charCount <= string_length(questions[day-1,0]) {
	charCount++
	if string_copy(questions[day-1,0],charCount,1) != "#" and string_copy(questions[day-1,0],charCount,1) != " " audio_play_sound(tlk_default,0,false)
	alarm[1] = 5
}