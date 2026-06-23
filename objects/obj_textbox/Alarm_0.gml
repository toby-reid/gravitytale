/// @desc sound/char

if (charCount < m_charCountTarget)
{
    ++charCount;
    if (currentPageConfig.autoskipAt > 0 && charCount > currentPageConfig.autoskipAt)
    {
        skip_text();
    }
    else
    {
        alarm[0] = currentPageConfig.charRate;
    }
}
else
{
    if (currentPageConfig.autocontinue)
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
    var _next_char = m_char_at(charCount + 1);
    if (_next_char != ")")
    {
        alarm[0] *= 10;
    }
}
else if (_char == global.TEXT_FLAGS.ESCAPE)
{
    ++charCount;
}

if (charCount % 2 == 0 || currentPageConfig.charRate > m_DEFAULTS.charRate)
{
    if (
        !array_contains(global.TEXT_FLAGS.SOFT_PUNCTUATION, _char)
        && !array_contains(global.TEXT_FLAGS.HARD_PUNCTUATION, _char)
        && !array_contains([global.TEXT_FLAGS.NEWLINE_BUTTON, global.TEXT_FLAGS.PAUSE, " "], _char)
    )
    {
        audio_play_sound(currentPageConfig.sound, 0, false);
    }
}
