/// @description sound/char
//if(charRate[page]%1 == 0) {
	charCount++
	alarm[0] = charRate[page]
/*}
else {
	charCount += 1/charRate[page]
	alarm[0] = 1
}*/
if grow == 0 {
	var char = string_copy(segText[segment],charCount,1)
	while(char == "#") {charCount++; char = string_copy(segText[segment],charCount,1)}
	if(char == ",") alarm[0] = 4*charRate[page]
	else if(string_copy(segText[segment],charCount+1,1) == "&") or char=="`" alarm[0] = 10*charRate[page]
	if(charCount <= string_length(segText[array_length(segText)-1]))
		if(charCount%2 == 0 or charRate[page] >= 4) and (char!="&" and char!=" " and char!="`")
			audio_play_sound(sound[page],0,false)
}