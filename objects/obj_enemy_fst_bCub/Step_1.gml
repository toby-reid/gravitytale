///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "That was a close shave."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "Beard Cub has been hairt badly.&It is now trying to shave...      #er, save you."}

if global.stage[0] == 5 {
	if timer > 0 {
		if grow == 1 {stage = 1; sprite_index = spr_enemy_fst_bCub; obj_battleCore.text[0] = "Beard Cub's being has #reemerged."}
		if grow > 0 grow--
	}
	timer = 0
	create = true
}