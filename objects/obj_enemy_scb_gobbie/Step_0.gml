/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 if instance_exists(obj_atk_gobbieHead) timer += 75
	if timer mod 150 == 0 instance_create_layer(-20+680*irandom(1),255+irandom(130),layer,obj_atk_gobbieHead)
	if instance_number(obj_atk_gobbieHead) > 2+instance_number(obj_enemy) global.stage[0]++
	timer++
}