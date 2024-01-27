/// @description Text Bubble
bubble = instance_create_layer(x+60,y,layer,obj_textBubble)
with bubble {
	text[0] = other.bubbleText
	for(var i = 0; i < array_length(text); i++) {font[i] = fnt_sans_bubble; sound[i] = tlk_stans}
	image_index = 1
}
sprite_index = index