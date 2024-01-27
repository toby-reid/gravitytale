/// @description Page Setup
//MUST BE AN ALARM! or Creation Code misfires
if(page < array_length(text)-1) page++
else {
	grow = -.2
	if instance_exists(obj_dipper) obj_dipper.canMove = setMove
}

segText = []
segColor = []
if string_copy(text[page],1,1) != "@" segColor[0] = c_white
var copyChar = 1
for(var i = 1; i < string_length(text[page]); i++) if(string_copy(text[page],i,1) == "@") {
	if i != 1 {
		if(array_length(segText) > 0) segText[array_length(segText)] = segText[array_length(segText)-1] + string_copy(text[page],copyChar,i-copyChar)
		else segText[0] = string_copy(text[page],copyChar,i-copyChar)
	}
	segColor[array_length(segColor)] = scr_hexdec(string_copy(text[page],i+1,6))
	i += 7
	copyChar = i
}
if(array_length(segText) > 0) segText[array_length(segText)] = segText[array_length(segText)-1] + string_copy(text[page],copyChar,i-copyChar+1)
else segText[0] = string_copy(text[page],copyChar,i-copyChar+1)

head[array_length(head)] = noone
if(head[page] == 0) head[page] = noone
charRate[array_length(charRate)] = 2
if(charRate[page] == 0) charRate[page] = 2
if(charRate[page]%1 != 0) charRate[page] = 1/charRate[page]
font[array_length(font)] = fnt_basic_gui
if(font[page] == 0) font[page] = fnt_basic_gui
style[array_length(style)] = 0
sound[array_length(sound)] = tlk_default
if(sound[page] == 0) sound[page] = tlk_default
choice[array_length(choice)] = 0
action[array_length(action)] = 0//Left, Right, Up, Down

swapTime = []
timer = []
drawShift = [32]
swapTime[string_length(segText[array_length(segText)-1])] = 0
timer[string_length(segText[array_length(segText)-1])] = 0
drawShift[string_length(segText[array_length(segText)-1])] = 0

charCount = 0
segment = 0
/*if(charRate[page]%1 == 0)*/ alarm[0] = charRate[page]
//else alarm[0] = 1