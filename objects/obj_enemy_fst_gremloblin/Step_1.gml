///@desc Override - Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "\"Ew, I don't like 'em!&\"I don't like Gremloblins!\"&- JonTron, probably"
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "Gremloblin realises it is not #actually invincible, #so it decides to be spared."}

if global.stage[0] == 5 {timer = 0; create = true; lasers = []}