/// @desc Skip text (if skippable)
if (charCount < m_charCountTarget)
{
    if (currentPageConfig.isSkippable)
    {
        skip_text();
    }
}
else if (!is_undefined(currentPageConfig.cancelAction))
{
    currentPageConfig.cancelAction();
}
