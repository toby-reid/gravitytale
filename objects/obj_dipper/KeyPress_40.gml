if (canMove)
{
    if (image_speed == 0 && image_index % 2 == 0)
    {
        ++image_index;
    }
}
else if (m_menu != DIPPER_MENU.CLOSED)
{
    if (m_menu == DIPPER_MENU.PRIMARY_SELECT)
    {
        ++m_menu_primary;
        var _max = (global.player.df == AT_DF.NONE) ? 1 : 2;
        if (m_menu_primary > _max)
        {
            m_menu_primary = 0;
        }
        audio_play_sound(sfx_beep, 0, false);
    }
    else if (m_menu == DIPPER_MENU.ITEM_LIST)
    {
        var _new_item = m_menu_item + 1;
        if (_new_item >= array_length(m_inventory))
        {
            _new_item = 0;
        }
        if (_new_item != m_menu_item)
        {
            m_menu_item = _new_item;
            audio_play_sound(sfx_beep, 0, false);
        }
    }
}
