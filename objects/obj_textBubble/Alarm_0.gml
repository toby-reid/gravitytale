/// @desc sound/char

if (charCount < m_charCountTarget)
{
    ++charCount;
    alarm[0] = currentPageConfig.charRate;
}
else
{
    exit;
}

var _char = scr_stringArray_charAt(m_pageSegmentText, charCount);
while (_char == global.TEXT_FLAGS.NEWLINE || _char == "\n")
{
    ++charCount;
    _char = scr_stringArray_charAt(m_pageSegmentText, charCount);
}

if (array_contains(global.TEXT_FLAGS.SOFT_PUNCTUATION, _char))
{
    alarm[0] *= 4;
}
else if (array_contains(global.TEXT_FLAGS.HARD_PUNCTUATION, _char) || _char == global.TEXT_FLAGS.PAUSE)
{
    alarm[0] *= 10;
}
else if (_char != global.TEXT_FLAGS.NEWLINE_BUTTON && _char != " ")
{
    if (_char == global.TEXT_FLAGS.ESCAPE)
    {
        ++charCount;
    }
    if (currentPageConfig.sound != silence && currentPageConfig.sound != -1 && (charCount % 2 == 0 || currentPageConfig.charRate > m_DEFAULTS.charRate))
    {
        audio_play_sound(currentPageConfig.sound, 0, false);
    }
}
