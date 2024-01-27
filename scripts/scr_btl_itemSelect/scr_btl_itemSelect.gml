// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_btl_itemSelect(v0r1) {///@desc r 1, l -1, u/d 0
	var before = global.stage[3]
	if v0r1 == 0 {//up/down
		if global.inventory[before-2*((before%2)-.5)] != item.none global.stage[3] = before-2*((before%2)-.5)
		if before == global.stage[3] if global.inventory[3-before+4*floor(before/4)] != item.none global.stage[3] = 3-before+4*floor(before/4)
	}
	else {//right/left
		var stupid = true
		for(var i = before; global.stage[3] == before and (i != before or stupid); stupid = false) {
			i += 2*v0r1
			if i > 7 i -= 8
			if i < 0 i += 8
			if global.inventory[i] != item.none global.stage[3] = i
			else if global.inventory[i-2*((before%2)-.5)] != item.none global.stage[3] = i-2*((before%2)-.5)
		}
	}
	if before != global.stage[3] {audio_play_sound(sfx_beep,0,false); return true}
	else return false
}