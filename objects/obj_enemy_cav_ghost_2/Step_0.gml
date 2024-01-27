/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble) if global.stage[0] == 4 if instance_find(obj_enemy_cav_ghost,0)==id {
	timer++
	if timer%60 == 0 {
		if timer >= 300 global.stage[0]++
		else with instance_create_layer(obj_soul.x/*242+2*irandom(56)*/,obj_soul.y/*256+2*irandom(42)*/,layer,obj_atk_beaver) {
			at = other.at
			sprite_index = spr_atk_cat2
			image_index = irandom(1)
			image_alpha = 0
		}
	}
	for(var i = 0; i < instance_number(obj_battleAttack); i++) with instance_find(obj_battleAttack,i) if image_alpha < 1 image_alpha += .025
}}
else if alarm[5] == -1 image_alpha += .05