text = ["You picked up something!"]//Be sure to change
font = []//Only change if written by certain person
sound = []//Only change if written by certain person
charRate = []//Change as needed
get = item.none
//style not needed.
//head not needed.
///@desc text[],item

trashCan = room_get_name(room); // Change as needed
if !variable_global_exists("trashCan") global.trashCan = []
alarm[0] = 1;