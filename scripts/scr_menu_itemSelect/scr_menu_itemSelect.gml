/// @desc
/// @param {real} dir: 1 for going down the line, -1 for going up
function scr_menu_itemSelect(dir) {
	var inv = false;
	for(var i = 0; i < array_length(global.inventory); i++) {
		if (global.inventory[i] != ITEM_NAME.NONE) {
			inv = true;
			break;
		}
	}
	if inv {
		for(var i = global.menu[1] + dir; i != global.menu[1]; i += dir) {
			if i < 0 {
				i = array_length(global.inventory) - 1;
			}
			else if i >= array_length(global.inventory) {
				i = 0;
			}
			if global.inventory[i] != ITEM_NAME.NONE {
				if (i != global.menu[1]) {
					audio_play_sound(sfx_beep,0,false)
				}
				global.menu[1] = i;
				return true;
			}
		}
	}
	return false;
}