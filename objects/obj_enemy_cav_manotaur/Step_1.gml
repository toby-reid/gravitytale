///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "Manotaur has been defeated in #an honorary duel.&He is happy to go that way."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "Manotaur was easily defeated #in battle.&He shamefully backs down."}

if global.stage[0] == 5 {timer = 0; create = true}