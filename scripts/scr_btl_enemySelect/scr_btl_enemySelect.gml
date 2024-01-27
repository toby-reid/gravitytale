// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_btl_enemySelect(dir) {
	for(var i = global.stage[2]+dir; i != global.stage[2]; i+=dir) {
		if i < 0 i = array_length(global.enemy)-1
		if i >= array_length(global.enemy) i = 0
		if i == global.stage[2] return false
		else if instance_exists(global.enemy[i]) {
			if global.stage[0] == 1 audio_play_sound(sfx_beep,0,false)
			global.stage[2] = i
			return true
		}
	}
}