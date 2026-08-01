/// @description Attack
if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer >= 450 global.stage[0]++
	else if timer%30 == 0 {
		var dir = irandom(60) + 105
		with instance_create_layer(x+lengthdir_x(120,dir),y+lengthdir_y(120,dir),layer,obj_battleAttack) {
			sprite_index = spr_atk_cat3
			image_alpha = 0
			image_angle = irandom(359)
			at = other.at
			direction = point_direction(x,y,other.x,other.y)
			speed = 1
		}
	}
	for(var i = 0; i < instance_number(obj_battleAttack); i++) with instance_find(obj_battleAttack,i) {
		if image_alpha < 1 image_alpha += .05
		else if speed == 1 { if y >= other.y {
			direction = irandom(45) + 248
			speed = 5
		}}
		else if y >= 500 instance_destroy()
	}
	timer++
}
if image_alpha < 1 if alarm[5] == -1 if stage == 0 image_alpha += .05