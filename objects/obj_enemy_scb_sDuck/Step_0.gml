/// @description Attack
if image_alpha == 1 if create if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	switch timer {
		case 30:
			if instance_exists(obj_atk_duckBeak) create = false
			else instance_create_layer(obj_soul.x,obj_soul.x,"Instances",obj_atk_duckBeak)
			break
		case 90: with instance_create_layer(obj_soul.x,obj_soul.y,"Instances",obj_atk_duckBeak) image_xscale=-2 break
		case 150: global.stage[0]++ break
	}
	timer++
}