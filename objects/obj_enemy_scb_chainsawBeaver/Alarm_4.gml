/// @description textBubble
with instance_create_layer(x+64,y-92,"Instances",obj_textBubble_old) {
	text[0] = choose("(happy beaver noises)","(sounds not unlike those of a gobblewonker)")
	image_index = 1
	other.bubble = id
}