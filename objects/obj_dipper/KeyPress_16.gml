if (!instance_exists(obj_textbox))
{
    if (m_menu != DIPPER_MENU.CLOSED)
    {
        if (m_menu == DIPPER_MENU.PRIMARY_SELECT)
        {
            m_toggle_menu();
        }
        else if (m_menu == DIPPER_MENU.ITEM_LIST)
        {
            m_menu = DIPPER_MENU.PRIMARY_SELECT;
            audio_play_sound(sfx_beep, 0, false);
        }
        else if (m_menu == DIPPER_MENU.ITEM_ACTION)
        {
            m_menu = DIPPER_MENU.ITEM_LIST;
            audio_play_sound(sfx_beep, 0, false);
        }
        else if (m_menu == DIPPER_MENU.JOURNAL)
        {
            m_menu = DIPPER_MENU.PRIMARY_SELECT;
            audio_play_sound(sfx_beep, 0, false);
        }
    }
}
