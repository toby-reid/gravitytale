/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	/*if array_length(lasers) == 0 {
		lasers[0] = instance_create_layer(x-27,y-78,"Instances",obj_atk_gremEyes)
		lasers[1] = instance_create_layer(x-2,y-78,"Instances",obj_atk_gremEyes)
		if num >= 0 lasers[0].dir = 1
		if num >= 1 lasers[1].dir = 1
	}
	else for(var i = 0; i < 2; i++) {
		if !instance_exists(lasers[i]) {
			lasers[i] = instance_create_layer(x-27+25*i,y-78,"Instances",obj_atk_gremEyes)
			if num >= i lasers[i].dir = 1
		}
		lasers[i].num = num
	}*///old system.
	if timer == 0 if instance_find(obj_enemy,1) == id timer += 40
	if timer%80==0 and instance_number(obj_enemy)>1 instance_create_layer(x-2-5*(timer%160)/16,y-76,"Instances",obj_atk_grem_laser)
	else if timer%40==0 and instance_number(obj_enemy)==1 instance_create_layer(x-2-5*(timer%80)/8,y-76,"Instances",obj_atk_grem_laser)
	if timer >= 360 global.stage[0]++
	timer++
}
if spare image_speed = 1
else image_speed = .5