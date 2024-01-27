/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 if instance_exists(obj_atk_hawktoTent) timer += 45
	if timer mod 90 == 0 {
		if global.enemy[0] == id
			with instance_create_layer(250+irandom(140),140+360*irandom(1),layer,obj_atk_hawktoTent) {
				if y > 320 image_angle = 180
			}
		else//it's Player 2
			with instance_create_layer(120+400*irandom(1),265+irandom(105),layer,obj_atk_hawktoTent) {
				if x > 320 image_angle = 270
				else image_angle = 90
				alarm[1] = 32
			}
	}
	if timer == 300 global.stage[0]++
	timer++
}