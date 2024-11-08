/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer%70 == 0 {
		if global.enemy_killed[ENEMY.DEPUTY] or timer%140 == 0 with instance_create_layer(400,220,"Instances",obj_atk_sherBaton) {
			var rot = irandom(1)
			x -= 160*rot
			y += 200*rot
			image_angle += 180*rot
			if global.enemy_killed[ENEMY.DEPUTY] {
				if x < 320 {x += 10; y -= 10}
				else {x -= 10; y += 10}
			}
		}
		if timer >= 600 global.stage[0]++
		else if timer >= 420 if !global.enemy_killed[ENEMY.DEPUTY] global.stage[0]++
	}
	timer++
}