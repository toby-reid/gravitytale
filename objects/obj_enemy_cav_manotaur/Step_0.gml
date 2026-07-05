/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer%120 == 0 or (instance_number(obj_enemy)==1 and timer%60==0) {
		var dest = (x != 320) ? 180 + 280*(x>320) : 180 + 280*irandom(1);
		with instance_create_layer(dest,280+40*irandom(2),layer,obj_atk_beaver) {
			sprite_index = spr_atk_danFist
			at = other.at
			if x > 320 image_xscale = -2
			hspeed = (image_xscale/instance_number(obj_enemy))/2
		}
	}
	if timer >= 600 global.stage[0]++
	timer++
}