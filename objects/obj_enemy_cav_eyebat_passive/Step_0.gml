/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer >= 60 {
		if instance_number(obj_battleEnemy) == 1 or instance_number(obj_enemy_cav_eyebat_passive) == 2 
			global.stage[0]++
	}
	timer++
}
if active {
	image_speed = 1
	if image_index >= 8 {
		image_speed = 0
		if(alarm[11] == -1) alarm[11] = 60
	}
}