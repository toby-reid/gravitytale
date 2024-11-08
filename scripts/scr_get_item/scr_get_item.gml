/// @desc
/// Usage:
/// scr_get_item(ITEM_NAME)
/// 
/// Returns whether we could successfully add the requested item
function scr_get_item(itemName, playSound=false) {
	for(var slot = 0; slot < array_length(global.inventory); slot++)
		if global.inventory[slot] == ITEM_NAME.NONE {
			global.inventory[slot] = itemName;
			if playSound and !audio_is_playing(sfx_itemGet) {
				audio_play_sound(sfx_itemGet,0,false)
			}
			return true//successfully assigned slot
		}
	return false//full inventory
}