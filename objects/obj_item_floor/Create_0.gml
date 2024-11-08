text = ["You picked up something!"]//Be sure to change
font = []//Only change if written by certain person
sound = []//Only change if written by certain person
charRate = []//Change as needed
get = ITEM_NAME.NONE;
//style not needed.
//head not needed.
///@desc text[],item

if !variable_global_exists("trashCan") global.trashCan = []
for (var i = 0; i < array_length(global.trashCan); i++) {
	if (global.trashCan[i] == id) {
		instance_destroy();
		break;
	}
}