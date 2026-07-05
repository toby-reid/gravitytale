///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "I guess you could say you've #issued... baptism by fire."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "Scampfire is no longer as #fired up."}

if global.stage[0] == 5 {
	timer = 0
	if instance_number(obj_enemy) == 2 if global.enemy[1] == id timer = 30
	create = true
}