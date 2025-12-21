if hp <= 0 if global.stage[0] != 3 {
	hp = 0
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 {
		global.enemy_killed[ENEMY.BLENDIN] = true
		//Do not write "Killed" or "spared" with this object!
		instance_destroy()
	}
	instance_destroy(bubble)
}

if spare if global.stage[1] == 0 if global.stage[4] > 0 global.stage[4] = 99

if global.player.hp <= 0 {
	scr_diedToEnemy(ENEMY.BLENDIN);
}
if global.stage[0] == 5 {timer = 0}