charCount++
alarm[0] = 6
if charCount >= string_length(text[page])+10 { if page < array_length(text)-1 {
	charCount = 0
	page++
	if page == array_length(text)-1 with instance_create_layer(0,0,layer,obj_fadeWhite) goto = ow_cav_16_crypt
	for(var i = 0; i < string_length(text[page]); i++) timer[i] = 0
}}
else if charCount <= string_length(text[page]) {
	var char = string_copy(text[page],charCount,1)
	while char=="#" {charCount++; char = string_copy(text[page],charCount,1)}
	if char=="," or char=="." or char=="&" alarm[0] *= 2
	else if char!=" " audio_play_sound(tlk_bill,0,false)
	if page == array_length(text)-1 alarm[0] *= 2
}