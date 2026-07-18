if (array_contains(global.oneTimeInstances, id))
{
    instance_destroy();
    exit;
}

text = ["You picked up something!"]//Be sure to change
font = []//Only change if written by certain person
sound = []//Only change if written by certain person
charRate = []//Change as needed
get = ITEM_INDEX.NONE;
//style not needed.
//head not needed.
///@desc text[],item
