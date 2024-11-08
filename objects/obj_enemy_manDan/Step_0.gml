/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 {
		prev = at
		if encouraged at++
		if buffed at += 3
		if attack == 2 with instance_create_layer(320,0,"Instances",obj_battleAttack) sprite_index = spr_atk_danKeg
	}
	switch attack {
		case 0: if timer%50 == 0 {//axe
			var dir = irandom(360)
			instance_create_layer(320+lengthdir_x(240,dir),320+lengthdir_y(240,dir),"Instances",obj_atk_danAxe)
		} break
		case 1: if timer%30 == 0 {//fists
			instance_create_layer(0,0,"Instances",obj_atk_danFist)
		} break
		case 2: if timer%20 == 0 {//meat
			with instance_create_layer(260+irandom(120),0,"Instances",obj_battleAttack) {
				at = other.at
				vspeed = 3
				sprite_index = spr_atk_danMeat
				image_index = irandom(3)
			}
		} break
		case 3: if timer%40 == 0 {//dancakes
			instance_create_layer(320,120,"Instances",obj_atk_dancakes)
		} break
	}
	if global.player.hp <= 0 {
		ini_open("Reset.save")
		ini_write_real("D",ENEMY.MANLY_DAN,ini_read_real("D",ENEMY.MANLY_DAN,0)+1)
		ini_close()
		global.stage[0]++
	}
	timer++
	if timer >= 600 if !instance_exists(obj_atk_tylerAssist) {at = prev; global.stage[0]++; if instance_exists(obj_enemy_tyler) if obj_enemy_tyler.distracted > 0 obj_enemy_tyler.distracted--}
}