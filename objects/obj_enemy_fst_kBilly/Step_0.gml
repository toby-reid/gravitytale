/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 if instance_find(obj_enemy_fst_kBilly,1) == id timer += 45
	if (instance_number(obj_battleEnemy)==1 and timer%45==0) or timer%90==0 {
		var drawx = irandom(1)
		if instance_number(obj_battleEnemy) > 1 drawx = 0 + (x > 320)
		instance_create_layer(120+400*drawx,270+2*irandom(50),layer,obj_atk_killClaws)
	}
	timer++
	if timer >= 360 global.stage[0]++
}