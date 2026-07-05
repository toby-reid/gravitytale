/// @description Attacks
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	switch timer {
	case 10: instance_create_layer(x,y+20,"Instances",obj_atk_cowlEgg) break
	case 120: if instance_number(obj_enemy) == 1 instance_create_layer(x,y+20,"Instances",obj_atk_cowlEgg) break
	case 220: instance_create_layer(x,y+20,"Instances",obj_atk_cowlEgg) break
	case 300: global.stage[0]++ break
	}
	timer++
}