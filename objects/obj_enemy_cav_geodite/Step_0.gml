/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer == 0 instance_create_layer(280+5*(x-192)/16,320,layer,obj_atk_geodite)
		//192, 320, 448
		//^ 128
		//280, 320, 360
		//^ 40
	else if timer >= 480 global.stage[0]++
	timer++
}