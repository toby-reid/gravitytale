/// @description textBubble
if image_alpha == 1 with instance_create_layer(x+40,y-40,"Instances",obj_textBubble) {
	image_index = 1
	text = ["(sounds not unlike those of a beaver with a chainsaw)"]
	charRate = [1]
	other.bubble = id
}