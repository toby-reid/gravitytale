/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if at == 0 {
		global.stage[0] = 3
		event_perform(ev_alarm,5)
	}
	else {
		if timer%30 == 0 {
			if timer == 420 global.stage[0]++
			else {
				var dir = irandom(359)
				with instance_create_layer(obj_soul.x+lengthdir_x(200,dir),obj_soul.y+lengthdir_y(200,dir),layer,obj_battleAttack) {
					at = other.at
					sprite_index = spr_atk_cat1
					image_xscale = 2
					image_yscale = 2
					image_alpha = 0
					image_index = 2 + irandom(2)
					image_angle = 90 * irandom(3)
					direction = point_direction(x,y,obj_soul.x,obj_soul.y)
					speed = 2
				}
			}
		}
		for(var i = 0; i < instance_number(obj_battleAttack); i++) with instance_find(obj_battleAttack,i) {
			if image_alpha < 1 image_alpha += .1
			direction += 2 * (((point_direction(x,y,obj_soul.x,obj_soul.y)-direction) > 0) - .5)
		}
		timer++
	}
}}
else if alarm[5] == -1 image_alpha += .05