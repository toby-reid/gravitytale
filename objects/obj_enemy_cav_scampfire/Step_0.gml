/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if (timer%30==0 and instance_number(obj_enemy)==1) or timer%60==0 {
		if timer >= 540 global.stage[0]++
		else with instance_create_layer(x,y+30,layer,obj_battleAttack) {
			sprite_index = spr_atk_scampfireball
			at = other.at
			direction = point_direction(x,y,obj_soul.x,obj_soul.y)+random(2)-1
			speed = 2
		}
	}
	timer++
}