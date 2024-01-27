/// @description Bubble
bubble = instance_create_layer(x+40,y,layer,obj_textBubble)
with bubble {
	if global.stage[1] == 1 and global.stage[5] == 1 text[0] = "Don't #look #at me..."
	else text[0] = "Look #at me..."
	style[0] = 4
}