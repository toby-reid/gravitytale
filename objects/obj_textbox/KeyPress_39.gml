if (m_pageConfig.choiceCount > 1)
{
    if (m_choiceSelection != 1)
    {
        audio_play_sound(sfx_beep, 0, false);
    }
    m_choiceSelection = 1;
}
