/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	timer++
	if timer%60 == 0 {
		if timer == 60 if instance_exists(obj_battleAttack) create = false
		if create {
			instance_create_layer(x,y,"Instances",obj_atk_moustache)
			if instance_number(obj_battleEnemy) == 2 other.create = false
		}
		else create = true
	}
	if timer >= 450 global.stage[0]++
}