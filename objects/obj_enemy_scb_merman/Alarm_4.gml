///@desc textBubble
bubble = instance_create_layer(x+70,y-20,"Instances",obj_textBubble)
with bubble {
	if other.bubbleText != "" text = [other.bubbleText]
	else text = [choose("Hola","They call me... Mermando.","(Dolphin-\nlike noises)")]
}