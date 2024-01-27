function scr_get_item(iIndex, playSound) {
	// scr_get_item(item.name)

	for(var slot = 0; slot < 8; slot++)
		if global.inventory[slot] == item.none {
			global.inventory[slot] = iIndex
			if playSound if !audio_is_playing(sfx_itemGet) audio_play_sound(sfx_itemGet,0,false)
			return true//successfully assigned slot
			exit
		}

	return false//full inventory
}