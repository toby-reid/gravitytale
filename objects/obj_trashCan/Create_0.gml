text = ["If you are reading this, #an error occurred.&@ff0000Please report this!"]//Be sure to change
font = []//Only change if written by certain person
sound = []//Only change if written by certain person
charRate = []//Change as needed
//style not needed.
//head not needed.
//alarm[0] = 1

get = ITEM_INDEX.NONE;
newText = text
if !variable_global_exists("trashCan") global.trashCan = []; // array of IDs
for (var i = 0; i < array_length(global.trashCan); i++) {
	if (global.trashCan[i] == id) {
		instance_destroy();
		break;
	}
}