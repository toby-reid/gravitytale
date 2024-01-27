var drawx = 56
var drawy = 333
for(var i = 1; i <= charCount and i <= string_length(text[page]); i++) {
	if drawx == 56 {
		draw_text(drawx,drawy,"*")
		drawx += string_width("* ")
	}
	
	if timer[i-1] < 30 {timer[i-1]++; draw_set_font(fnt_bill_gui)}
	else draw_set_font(fnt_basic_gui)
	
	var char = string_copy(text[page],i,1)
	if char=="#" {drawx = 56+string_width("* "); drawy += 35}
	else if char=="&" {drawx = 56; drawy += 35}
	else {
		draw_text(drawx+irandom(2)-1,drawy+irandom(2)-1,char)
		drawx += string_width(char)
	}
}