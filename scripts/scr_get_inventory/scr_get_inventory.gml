function scr_get_inventory()
{
    var _inv = [];
    for (var i = 0, _inventory_size = array_length(global.inventory); i < _inventory_size; ++i)
    {
        var _item = global.inventory[i];
        if (_item != ITEM_INDEX.NONE)
        {
            array_push(_inv, _item);
        }
    }
    return _inv;
}
