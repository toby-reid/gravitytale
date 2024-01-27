// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_menu_itemSelect(dir) {
	var inv = false
	for(var i = 0; i <= 7; i++) if global.inventory[i] != item.none inv = true
	if inv for(var i = global.menu[1]+dir; i != global.menu[1]; i += dir) {
		if i == -1 i = 7
		if i == 8 i = 0
		if global.inventory[i] != item.none {
			if i != global.menu[1] audio_play_sound(sfx_beep,0,false)
			global.menu[1] = i
			return true
		}
	}
	else return false
}