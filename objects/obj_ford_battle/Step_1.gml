///@desc Dying / Round Reset
if hp <= 0 if global.stage[0] != 3 if !instance_exists(obj_textBubble_old) {
	if image_alpha == 1 {
		audio_play_sound(sfx_enemyDead,0,false)
		global.enemy[0] = instance_create_layer(x,y+40,"Instances",obj_enemySoulBreak)
		global.enemy[0].image_index = 2
	}
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
	if global.player.genocide == RUN.ACTIVE and global.areaKills[AREA.FOREST] < global.MAX_KILLS[AREA.FOREST] {
		global.player.genocide = RUN.ABORTED;
	}
}
if spare if global.stage[0] == 3 if global.stage[1] == 0 if global.stage[4] > 0 global.stage[4] = 9999

if global.player.hp <= 0 {
	scr_diedToEnemy(enemy_index);
}
if global.stage[0] == 5 {timer = 0; create = true}