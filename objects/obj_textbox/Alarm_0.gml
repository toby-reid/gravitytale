/// @desc sound/char

if (charCount < m_charCountTarget)
{
    ++charCount;
    if (m_pageConfig.autoskipAt > 0 && charCount > m_pageConfig.autoskipAt)
    {
        skip_text();
    }
    else
    {
        alarm[0] = m_pageConfig.charRate;
    }
}
else
{
    if (m_pageConfig.autocontinue)
    {
        next_page();
    }
    exit;
}

var _char = m_char_at(charCount);
while (_char == global.TEXT_FLAGS.NEWLINE)
{
    ++charCount;
    _char = m_char_at(charCount);
}

if (array_contains(global.TEXT_FLAGS.SOFT_PUNCTUATION, _char))
{
    alarm[0] *= 4;
}
else if (array_contains(global.TEXT_FLAGS.HARD_PUNCTUATION, _char) || _char == global.TEXT_FLAGS.PAUSE)
{
    alarm[0] *= 10;
}
else if (_char == global.TEXT_FLAGS.ESCAPE)
{
    ++charCount;
}

if (charCount % 2 == 0 || m_pageConfig.charRate > m_DEFAULTS.charRate)
{
    if (
        !array_contains(global.TEXT_FLAGS.SOFT_PUNCTUATION, _char)
        && !array_contains(global.TEXT_FLAGS.HARD_PUNCTUATION, _char)
        && !array_contains([global.TEXT_FLAGS.NEWLINE_BUTTON, global.TEXT_FLAGS.PAUSE, " "], _char)
    )
    {
        audio_play_sound(m_pageConfig.sound, 0, false);
    }
}
