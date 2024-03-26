text = ["If you are reading this, #an error occurred.&@ff0000Please report this!"]//Be sure to change
font = []//Only change if written by certain person
sound = []//Only change if written by certain person
charRate = []//Change as needed
//style not needed.
//head not needed.
//alarm[0] = 1

get = item.none
newText = text
trashCan = room_get_name(room); // Change to a String if needed in CC.
if !variable_global_exists("trashCan") global.trashCan = []
alarm[0] = 1; // so it triggers after CC