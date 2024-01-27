/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 if instance_exists(obj_battleAttack) create = false
	if timer%50 == 0 {
		if flipped == 0 {
			if create {
				var dir = irandom(359)
				instance_create_layer(320+lengthdir_x(120,dir),320+lengthdir_y(120,dir),"Instances",obj_atk_gnome)
				if instance_number(obj_battleEnemy) == 2 create = false
			}
			else create = true
		}
		if timer >= 540 global.stage[0]++
	}
	timer++
}