/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer == 0 attack = irandom(2)//0memWipe, 1timeDust, 2lasers
	if !spare switch attack {
		case 0: if timer%15 == 0 with instance_create_layer(x+20,y+20,"Instances",obj_battleAttack) {
			sprite_index = spr_atk_blendin_memWipe
			direction = irandom(90)+215
			speed = 3
			at = other.at
		} break
		case 1: if timer%12 == 0 with instance_create_layer(irandom(150)+245,200,"Instances",obj_battleAttack) {
			sprite_index = spr_atk_blendin_dust
			direction = 270
			speed = 3
			at = other.at
		} break
		case 2: if timer%20 == 0 {
			if timer%8 == 0 with instance_create_layer(320,y+20,"Instances",obj_atk_blendin_laser) dir = 180
			else instance_create_layer(320,y+20,"Instances",obj_atk_blendin_laser)
		} break
	}
	else {
		if hair < 5 {
			if timer%8 == 0 with instance_create_layer(x+20,y+20,"Instances",obj_battleAttack) {
				sprite_index = spr_atk_blendin_laser
				vspeed = -2
				hspeed = random(1)-.5
				image_angle = irandom(20)-10
			}
			if timer%50 == 0 hair++
		}
		else if !instance_exists(obj_battleAttack) global.stage[0]++
		with obj_battleAttack if y < 100 {image_alpha -= .1; if image_alpha == 0 instance_destroy()}
	}
	if timer >= 500 global.stage[0]++
	timer++
	bubbleText = []
}