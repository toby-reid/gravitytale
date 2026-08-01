/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	timer++
	if timer%30 == 0 {
		if timer >= 420 global.stage[0]++
		else {
			var dir = irandom(359)
			with instance_create_layer(obj_soul.x+lengthdir_x(120,dir),obj_soul.y+lengthdir_y(120,dir),layer,obj_battleAttack) {
				sprite_index = spr_atk_cat6
				if other.attention <= 1 at = 0
				else if other.attention >= 10 at = other.at*2
				else at = other.at
				image_xscale = 2
				image_yscale = 2
				image_angle = dir+180
				direction = image_angle
				speed = 6
			}
		}
	}
}}
else if alarm[5] == -1 image_alpha += .05