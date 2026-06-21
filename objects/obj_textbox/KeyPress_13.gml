/// @desc Continue to next page
if (charCount >= m_charCountTarget)
{
    if (m_pageConfig.choiceCount > 1)
    {
        if (array_length(m_pageConfig.choiceActions) > m_choiceSelection)
        {
            m_pageConfig.choiceActions[m_choiceSelection]();
        }
        while (array_length(choices_made) < page)
        {
            choices_made[array_length(choices_made)] = 0;
        }
        choices_made[page] = m_choiceSelection;
    }
    ++page;
    m_process_page(page);
}
