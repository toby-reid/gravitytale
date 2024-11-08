/// @desc
/// Returns an array containing all nonempty inventory slots found in
/// global.inventory[].
/// @return {array<real>}
function scr_getBattleInventory() {
	var inv = [];
	for (var i = 0; i < array_length(global.inventory); i++) {
		var item_name = global.inventory[i];
		if (item_name != ITEM_NAME.NONE) {
			array_push(inv, item_name);
		}
	}
	return inv;
}