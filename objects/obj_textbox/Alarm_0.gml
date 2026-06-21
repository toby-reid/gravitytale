/// @desc sound/char

++charCount;
if (m_pageConfig.autoskipAt > 0 && charCount >= m_pageConfig.autoskipAt)
{
    charCount = m_charCountTarget;
}
else if (charCount < m_charCountTarget)
{
    alarm[0] = m_pageConfig.charRate;
}

var _char = m_char_at(charCount);
while (_char == global.TEXT_FLAGS.NEWLINE)
{
    ++charCount;
    _char = m_char_at(charCount);
}
switch (_char)
{
    case ",":
        alarm[0] *= 4;
        break;
    case global.TEXT_FLAGS.NEWLINE_BUTTON:
    case global.TEXT_FLAGS.PAUSE:
        alarm[0] *= 10;
        break;
    case global.TEXT_FLAGS.ESCAPE:
        ++charCount;
        break;
}

if (charCount % 2 == 0 || m_pageConfig.charRate > m_DEFAULTS.charRate)
{
    if (!array_contains([global.TEXT_FLAGS.NEWLINE_BUTTON, global.TEXT_FLAGS.PAUSE, " "], _char))
    {
        audio_play_sound(m_pageConfig.sound, 0, false);
    }
}
