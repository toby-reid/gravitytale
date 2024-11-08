if global.player.genocide != RUN.ACTIVE or global.enemy_spared[ENEMY.TREMBLEY] or global.enemy_killed[ENEMY.TREMBLEY] {
	instance_destroy()
} else {
	stage = 0
}