function scr_remove_local_item(_local_inventory, _local_index)
{
    var _global_index = -1;
    for (var i = 0; i <= _local_index; ++i)
    {
        _global_index = scr_select_array(global.inventory, function(_global_item) {return _global_item != ITEM_INDEX.NONE;}, false, _global_index);
    }
    var _success = true;
    var _item_name = _local_inventory[_local_index];
    if (_global_index < 0 || _global_index >= array_length(global.inventory) || global.inventory[_global_index] != _item_name)
    {
        show_debug_message($"Failed to register global inventory; got {_global_index} from {global.inventory}");
        _success = false;
        _global_index = array_get_index(global.inventory, _item_name);
    }
    var _item = global.ITEM_INFO[? _item_name];
    global.inventory[_global_index] = _item.useResult;
    return _success;
}
