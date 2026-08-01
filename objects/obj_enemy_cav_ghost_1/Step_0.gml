/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer%45 == 0 {
		var dir = irandom(359)
		with instance_create_layer(obj_soul.x+lengthdir_x(160,dir),obj_soul.y+lengthdir_y(160,dir),layer,obj_battleAttack) {
			at = other.at
			sprite_index = spr_atk_cat1
			image_xscale = 2
			image_yscale = 2
			image_index = irandom(4)
			image_angle = 90*irandom(3)
			direction = point_direction(x,y,obj_soul.x,obj_soul.y)
			speed = 2
		}
	}
	timer++
	if timer >= 300 global.stage[0]++
}}
else if alarm[5] == -1 image_alpha += .05