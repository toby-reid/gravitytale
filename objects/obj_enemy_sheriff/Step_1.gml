///@desc Dying / Round Reset
if hp <= 0 {
	global.enemy_killed[ENEMY.SHERIFF] = true
	if global.stage[0] != 3 {
		hp = 0
		obj_battleCore.text[0] = "Sheriff Blubs?&More like SherRIP Blubs...&I'm sorry."
		if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
		image_alpha -= .05
		if image_alpha == 0 instance_destroy()
		instance_destroy(bubble)
	}
}

if global.stage[0] == 5 {timer = 0; create = true; bubbleText = "Solvin' some big crisis, city boy?"}