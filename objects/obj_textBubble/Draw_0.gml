draw_self();
if (m_growRate == 0)
{
    var _x_current = x + 28;
    var _y_current = y - 28;
    var _sep = 12;

    if (currentPageConfig.autosplit)
    {
        var _width = (image_index == 1) ? 110 : 65;
        var _color = m_pageSegmentColors[0];
        draw_text_ext_colour(_x_current, _y_current, string_copy(m_pageSegmentText[0], 1, charCount), _sep, _width, _color, _color, _color, _color, 1);
    }
    else
    {
        var _swap_text = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.FONT_SWAP);
        draw_set_font(_swap_text ? m_DEFAULTS.font : currentPageConfig.font);

        var _wave_text = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.WAVE);
        var _char_wave = m_charWaveTimer;

        var _shake_text = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.SHAKE);

        for (
            var _segment_index = 0, _segment_count = array_length(m_pageSegmentText), _total_char_count = 0;
            _segment_index < _segment_count && _total_char_count < charCount;
            ++_segment_index
        )
        {
            var _segment_text = m_pageSegmentText[_segment_index];
            var _segment_color = m_pageSegmentColors[_segment_index];
            for (
                var _segment_char_index = 1, _segment_length = string_length(_segment_text);
                _segment_char_index <= _segment_length && _total_char_count < charCount;
                ++_segment_char_index
            )
            {
                ++_total_char_count;

                var _char = string_char_at(_segment_text, _segment_char_index);
                switch (_char)
                {
                    case global.TEXT_FLAGS.NEWLINE_BUTTON:
                    case global.TEXT_FLAGS.NEWLINE:
                    case "\n":
                        _x_current = x + 28;
                        _y_current += _sep;
                        break;
                    case global.TEXT_FLAGS.PAUSE:
                        // noop
                        break;
                    case global.TEXT_FLAGS.ESCAPE:
                        ++_segment_char_index;
                        ++_total_char_count;
                        // For all escaped characters besides COLOR (for which ESCAPE is removed),
                        // the next item should be within the same segment
                        _char = string_char_at(_segment_text, _segment_char_index);
                        // fallthrough
                    case global.TEXT_FLAGS.COLOR: // if it's still in the text segments, it was escaped out
                    default:
                        if (_swap_text)
                        {
                            if (m_fontSwapIndex >= _swap_text - 1)
                            {
                                draw_set_font(currentPageConfig.font);
                            }
                        }
                        draw_text_colour(
                            _x_current + (_shake_text ? irandom_range(-1, 1) : 0),
                            _y_current + (_shake_text ? irandom_range(-1, 1) : 0) + (_wave_text ? m_wave_offset(_char_wave) : 0),
                            _char,
                            _segment_color, _segment_color, _segment_color, _segment_color, 1
                        );
                        if (_wave_text)
                        {
                            _char_wave = m_increment_wave(_char_wave);
                        }
                        _x_current += string_width(_char);
                        break;
                }
            }
        }
    }

    if (charCount >= m_charCountTarget && !instance_exists(obj_battleButtons_yn))
    {
        var _arrow_color = c_black;
        var _rotation = (page < array_length(m_text) - 1) ? 0 : 90;
        draw_sprite_ext(spr_moreText, m_continueArrowIndex, x + ((image_index == 1) ? 100 : 70), y + ((image_index == 1) ? 80 : 50), 2, 2, _rotation, _arrow_color, 1);
    }
}
