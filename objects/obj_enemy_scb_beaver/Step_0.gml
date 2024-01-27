if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	switch timer {
		case 0: with instance_create_layer(x-(x-320)*3/4,383,"Instances",obj_atk_beaver) image_index = other.image_index break
		case 300: global.stage[0]++ break
	}
	timer++
}