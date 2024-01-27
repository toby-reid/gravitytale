/// @desc Summon Bites
if irandom(1)==0 and (global.player[player.hp] <= 3 or obj_soos_battle.stage >= 13) {
	with instance_create_layer(irandom(48)+x-24,y,"Instances",obj_battleAttack) {
		sprite_index = spr_atk_soos_bBites
		image_angle = irandom(90)*4
		vspeed = 2
		image_blend = c_lime
		at = -1
	}
}
else {
	with instance_create_layer(irandom(48)+x-24,y,"Instances",obj_battleAttack) {
		sprite_index = spr_atk_soos_bBites
		image_angle = irandom(90)*4
		vspeed = 3
		at = other.at
	}
}
alarm[0] = 15