///@desc Dying / Round Reset
if hp <= 0 {
	global.enemy_killed[ENEMY.DEPUTY] = true
	if global.stage[0] != 3 {
		hp = 0
		obj_battleCore.text[0] = "With the loss of Durland,&Sheriff Blubs is a whirlwind                             #of emotion."
		if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
		image_alpha -= .05
		if image_alpha == 0 instance_destroy()
		instance_destroy(bubble)
	}
}

if global.stage[0] == 5 {timer = 0; create = true; bubbleText = "WOOOOOO!\nWE'RE GONNA GETCHA, CITY BOOOOOY!"}