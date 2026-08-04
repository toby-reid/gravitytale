if (canMove)
{
    if (image_speed == 0 && image_index % 2 == 0)
    {
        dir = DIRECTION.RIGHT;
        image_index = clamp_image_index() + 1;
    }
}
else if (m_menu != DIPPER_MENU.CLOSED)
{
    if (m_menu == DIPPER_MENU.ITEM_LIST)
    {
        var _page_max = 8;
        var _inventory_size = array_length(m_inventory);
        var _new_index;
        if (_page_max >= _inventory_size)
        {
            _new_index = _inventory_size - 1;
        }
        else
        {
            var _page = m_menu_item div _page_max;
            var _page_index = m_menu_item % _page_max;
            var _page_starts_at = _page_max * _page;
            _new_index = (_inventory_size < _page_starts_at + _page_max) ? _page_index : min(m_menu_item + _page_max, _inventory_size - 1);
        }
        if (_new_index != m_menu_item)
        {
            m_menu_item = _new_index;
            audio_play_sound(sfx_beep, 0, false);
        }
    }
    else if (m_menu == DIPPER_MENU.ITEM_ACTION)
    {
        ++m_menu_itemAction;
        if (m_menu_itemAction > 2)
        {
            m_menu_itemAction = 0;
        }
        audio_play_sound(sfx_beep, 0, false);
    }
}
