if (m_growRate == 0)
{
    if (scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.FONT_SWAP))
    {
        m_decrement_fontSwapTimers(charCount);
    }
    if (scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.WAVE))
    {
        m_charWaveTimer = m_increment_wave(m_charWaveTimer, -1);
    }
}
else
{
    image_xscale += m_growRate;
    image_yscale += m_growRate;
    if (m_growRate > 0 && image_xscale >= 1)
    {
        m_growRate = 0;
        image_xscale = 1;
        image_yscale = 1;
        m_process_page(page);
    }
    else if (m_growRate < 0 && image_xscale <= 0)
    {
        instance_destroy();
    }
}
