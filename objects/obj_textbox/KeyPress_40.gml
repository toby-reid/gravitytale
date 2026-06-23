if (currentPageConfig.choiceCount > 3)
{
    if (m_choiceSelection != 3)
    {
        audio_play_sound(sfx_beep, 0, false);
    }
    m_choiceSelection = 3;
}
