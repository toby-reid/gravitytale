/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer == 0 instance_create_layer(x,y+40,layer,obj_atk_merGuitar)
	else if timer == 500 global.stage[0]++
	timer++
	bubbleText = ""
}