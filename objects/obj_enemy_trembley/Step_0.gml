/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) { if global.stage[0] == 4 {
	if timer%20 == 0 {
		if timer == 480 global.stage[0]++
		else {
			for(var i = 0; i < instance_number(obj_atk_beaver); i++) with instance_find(obj_atk_beaver,i) y += 20
			/*for(var i = 0; i < instance_number(obj_atk_beaver); i++) with instance_find(obj_atk_beaver,i) {
				//if y < 360 and !place_meeting(x,y+20,obj_atk_beaver) {
					y += 20
					if keyboard_check_pressed(vk_left) if x > 260 x -= 20
					if keyboard_check_pressed(vk_right) if x < 380 x += 20
					if keyboard_check_pressed(vk_enter) image_angle -= 90
					if keyboard_check_pressed(vk_shift) image_angle += 90
				//}
			}*/
			if timer%60 == 0 {
				with instance_create_layer(260 + 20*irandom(6),120,layer,obj_atk_beaver) {
					sprite_index = spr_atk_baby
					image_xscale = 2
					image_yscale = 2
					image_angle = 90 * irandom(3)
					at = floor(other.at)
				}
			}
		}
	}
	timer++
	if(keyboard_check_pressed(vk_enter)) for(var i = 0; i < instance_number(obj_atk_beaver); i++) 
		with instance_find(obj_atk_beaver,i) image_angle += 90;
	if(keyboard_check_pressed(vk_shift)) for(var i = 0; i < instance_number(obj_atk_beaver); i++)
		with instance_find(obj_atk_beaver,i) image_angle -= 90;
}}
else bubble.x = x+80
if instance_exists(obj_nyarfGun) obj_nyarfGun.x = x