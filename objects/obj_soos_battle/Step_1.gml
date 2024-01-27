if hp <= 0 if global.stage[0] != 3 if !instance_exists(obj_textBubble) {
	hp = 0
	if image_alpha == 1 {
		audio_play_sound(sfx_enemyDead,0,false)
		global.enemy[0] = instance_create_layer(320,128,"Instances",obj_enemySoulBreak)
		global.enemy[0].image_index = 0
	}
	image_alpha -= .05
	if image_alpha == 0 {scr_get_item(item.infinite_pizza,false); instance_destroy()}
	instance_destroy(bubble)
}
else if variable_instance_exists(id,"result") switch result {
	case 0: if obj_textBubble.page == 1 sprite_index = spr_soos_face_disappoint_closed break
	case 1: switch obj_textBubble.page {
		case 2: sprite_index = spr_soos_face_disappoint break
		case 3: case 5: sprite_index = spr_soos_face_disappoint_closed break
		case 4: sprite_index = spr_soos_face_disapsmile break
	} break
	case 2: switch obj_textBubble.page {
		case 0: sprite_index = spr_soos_face_disappoint break
		case 1: case 3: sprite_index = spr_soos_face_disappoint_closed break
		case 2: case 5: sprite_index = spr_soos_face_disapsmile break
		case 4: sprite_index = spr_soos_face_disapsmile_side break
		case 6: sprite_index = spr_soos_face_disapsmile_closed break
	} break
}

if global.player[player.hp] <= 0 {
	ini_open("Reset.save")
	ini_write_real("D",enemy.soos,ini_read_real("D",enemy.soos,0)+1)
	ini_close()
}
if global.player[player.runActive] == 2 or spare if global.stage[4] > 0 if global.stage[1] == 0 {global.stage[4] = 999; sprite_index = spr_soos_face_surprise}