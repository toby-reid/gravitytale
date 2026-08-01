/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer == 0 if instance_find(obj_enemy,1) == id timer += 60
	if timer%120 == 0 or (timer%60 == 0 and (instance_number(obj_enemy) == 1 or instance_number(obj_enemy_cav_eyebat_passive) == 1))
		instance_create_layer(x+1,y-123,layer,obj_atk_eyeBeam)
	if timer >= 600 global.stage[0]++
	timer++
}