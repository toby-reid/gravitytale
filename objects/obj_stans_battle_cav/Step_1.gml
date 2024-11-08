///@desc Override - Dying / Round Reset
if (global.stage[0] == 3 and global.stage[1] == 0 and global.stage[4] > 0) or global.enemy_killed[ENEMY.STANS_CAVE] {
	global.stage[4] = 0
	if image_alpha == 1 {audio_stop_sound(mus_songMightPlay); audio_stop_sound(mus_songMightPlay); audio_play_sound(sfx_enemyDead,0,false)}
	image_alpha -= .05
	if global.stage[0] == 4 {instance_destroy(); instance_destroy(bubble)}
	global.enemy_killed[ENEMY.STANS_CAVE] = true
}

if global.stage[0] == 5 {timer = 0; create = true}