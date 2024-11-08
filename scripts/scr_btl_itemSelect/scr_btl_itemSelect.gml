/// @desc
/// @param keypress: right 1, left -1, up/down 0
function scr_btl_itemSelect(keypress) {
	var before = global.stage[3]
	if keypress == 0 {//up/down
		if global.inventory[before - 2*((before%2)-.5)] != ITEM_NAME.NONE {
			global.stage[3] = before - 2*((before%2)-.5);
		} else if global.inventory[3 - before + 4*floor(before/4)] != ITEM_NAME.NONE {
			global.stage[3] = 3 - before + 4*floor(before/4);
		}
	} else {//right/left
		var stupid = true;
		var i = before;
		do {
			i += 2 * keypress;
			if i > 7 i -= 8;
			if i < 0 i += 8;
			if (i == before) {
				return false;
			}
			if global.inventory[i] != ITEM_NAME.NONE {
				global.stage[3] = i;
				break;
			} else if global.inventory[i - 2*((before%2)-.5)] != ITEM_NAME.NONE {
				global.stage[3] = i - 2*((before%2)-.5);
				break;
			}
		} until (global.stage[3] != before);
	}
	if before != global.stage[3] {
		audio_play_sound(sfx_beep,0,false);
		return true;
	}
	return false;
}