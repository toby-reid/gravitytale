if (m_pageConfig.choiceCount > 2)
{
    if (m_choiceSelection != 2)
    {
        audio_play_sound(sfx_beep, 0, false);
    }
    m_choiceSelection = 2;
}
