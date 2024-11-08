/// @description Segment setup
if page < array_length(text)-1 page++
else grow = -.1

segText = []
segColor = []
if string_copy(text[page],1,1) != "@" segColor[0] = 0
var startChar = 1
for(var char = 1; char <= string_length(text[page]); char++) {
	if string_copy(text[page],char,1) == "@" {
		var oldText = (array_length(segText) > 0) ? segText[array_length(segText) - 1] : "";
		if char != 1 segText[array_length(segText)] = oldText+string_copy(text[page],startChar,char-startChar)
		segColor[array_length(segColor)] = scr_hexdec(string_copy(text[page],char+1,6))
		char += 7
		startChar = char
	}
}
var oldText = (array_length(segText) > 0) ? segText[array_length(segText) - 1] : "";
segText[array_length(segText)] = oldText+string_copy(text[page],startChar,string_length(text[page])-startChar+1)

charRate[array_length(charRate)] = .5
if charRate[page] == 0 charRate[page] = .5
sound[array_length(sound)] = silence
if sound[page] == 0 sound[page] = silence
font[array_length(font)] = fnt_basic_bubble
if font[page] == 0 font[page] = fnt_basic_bubble
style[array_length(style)] = 0

timer = []
drawAng = []
drawShift = [16]
timer[string_length(segText[array_length(segText)-1])] = 0
drawAng[string_length(segText[array_length(segText)-1])] = 0
drawShift[string_length(segText[array_length(segText)-1])] = 0

segment = 0
charCount = 0