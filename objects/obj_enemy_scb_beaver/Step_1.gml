if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "I am now a beleaver...&That you have slain an #innocent beaver."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha <= 0 {obj_enemy_scb_beaver.hug = -1; instance_destroy()}
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "Beaver has stopped cavorting."}

if global.stage[0] == 5 {timer = 0; create = true}