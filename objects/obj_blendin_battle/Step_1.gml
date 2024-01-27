if hp <= 0 if global.stage[0] != 3 {
	hp = 0
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 {
		global.killed[enemy.blendin] = true
		//Do not write "Killed" or "spared" with this object!
		instance_destroy()
	}
	instance_destroy(bubble)
}

if spare if global.stage[1] == 0 if global.stage[4] > 0 global.stage[4] = 99

if global.player[player.hp] <= 0 {
	ini_open("Reset.save")
	ini_write_real("D",enemy.blendin,ini_read_real("D",enemy.blendin,0)+1)
	ini_close()
}
if global.stage[0] == 5 {timer = 0; create = true}