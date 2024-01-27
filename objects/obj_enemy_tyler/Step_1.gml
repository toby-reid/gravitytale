///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "Tyler collapses without a word."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "Tyler is ready to collapse, #but his resolve holds strong."}

if global.stage[0] == 5 {
	timer = 0
	attack = -1
	if !instance_exists(obj_enemy_manDan) {image_index = 0; image_speed = 0}
	if distracted == 0 {image_xscale = 2; if obj_battleCore.text[0] = "Tyler is distracted.&Try something else now." obj_battleCore.text[0] = "Tyler is no longer distracted."}
}