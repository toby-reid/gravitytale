/// @description textBubble
with instance_create_layer(x+60,y-20,"Instances",obj_textBubble_old) {
	if array_length(other.bubbleText) == 0 text[0] = choose("ah, #geez...","oh man...","work, #dang #it...")
	else {text = other.bubbleText; image_index = 1}
	for(var i = 0; i < array_length(text); i++) {sound[i] = tlk_blendin; style[i] = 4}
	other.bubble = id
}