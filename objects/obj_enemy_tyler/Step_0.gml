/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if distracted == 0 {
		if timer == 0 {
			/*if instance_exists(obj_enemy_manDan) and !audio_is_playing(sfx_enemyDead) {
				
			}*/
			if !instance_exists(obj_enemy_manDan) or audio_is_playing(sfx_enemyDead) attack = 0
			if attack == 1 obj_enemy_manDan.buffed = true
			else if attack > 2 attack = 2
		}
		if attack == 0 {//Support
			if timer%20 == 0 if instance_number(obj_atk_tylerCuteBike) < 6 instance_create_layer(320,280,"Instances",obj_atk_tylerCuteBike)
		}
		else if timer%30==0 if timer < 600 with instance_create_layer(x,y,"Instances",obj_atk_tylerAssist) image_index = other.attack-1
	}
	else if !instance_exists(obj_enemy_manDan) global.stage[0]++
	if global.player.hp <= 0 if !instance_exists(obj_enemy_manDan) {
		scr_diedToEnemy(ENEMY.TYLER);
		global.stage[0]++
	}
	timer++
	if timer >= 600 if !instance_exists(obj_enemy_manDan) if !instance_exists(obj_atk_tylerAssist) {global.stage[0]++; distracted = 0}
}