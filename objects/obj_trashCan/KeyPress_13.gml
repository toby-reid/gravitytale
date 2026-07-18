if (is_interaction())
{
    event_inherited();
    if (get != ITEM_INDEX.NONE)
    {
        if (scr_get_item(get, true))
        {
            empty_can();
            array_push(global.oneTimeInstances, id);
        }
        else
        {
            var _full_text = is_array(full_inventory_text) ? full_inventory_text : [full_inventory_text];
            var _full_length = array_length(_full_text);
            var _new_text = array_create(_full_length);
            for (var i = 0; i < _full_length; ++i)
            {
                _new_text[i] = string_replace(_full_text[i], "[ITEM]", global.ITEM_INFO[get].name);
            }
            obj_textbox.set_text(_new_text);
        }
    }
}
