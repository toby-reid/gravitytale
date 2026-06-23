if (currentPageConfig.choiceCount > 1)
{
    if (m_choiceSelection != 0)
    {
        audio_play_sound(sfx_beep, 0, false);
    }
    m_choiceSelection = 0;
}
