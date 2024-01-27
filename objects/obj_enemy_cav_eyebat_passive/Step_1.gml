///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "Eyebat wishes you had #catarACTed instead."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if global.stage[0] == 4 if global.stage[1] == 0 if global.stage[4] > 0 if global.enemy[global.stage[2]] == id 
	obj_enemy_cav_eyebat_passive.active = true

if global.stage[0] == 5 {timer = 0; create = true}