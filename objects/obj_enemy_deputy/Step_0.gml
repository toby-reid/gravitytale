/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 instance_create_layer(320+120*(irandom(1)-.5),250,"Instances",obj_atk_depBell)
	else if timer >= 600 global.stage[0]++
	else if timer >= 420 if !global.killed[enemy.sheriff] global.stage[0]++
	
	timer++
}