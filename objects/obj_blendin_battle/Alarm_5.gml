/// @description Spare
if spare {
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 {
		global.spared[enemy.blendin] = true
		global.player[player.spares]++
		//Do not write "Killed" or "spared" with this object!
		instance_destroy()
	}
	else alarm[5] = 1
	instance_destroy(bubble)
}