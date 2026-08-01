/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer == 30 {
		with instance_create_layer(x,y,layer,obj_atk_fairy) image_index = other.image_index
		image_alpha = 0
	}
	if timer > 120 if image_alpha == 1 global.stage[0]++
	timer++
}