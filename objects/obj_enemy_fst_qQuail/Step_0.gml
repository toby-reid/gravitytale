/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 instance_create_layer(320,320,"Instances",obj_atk_qMark)
	else if timer >= 420 global.stage[0]++
	timer++
}