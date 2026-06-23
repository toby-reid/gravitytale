draw_self();
if (m_growRate != 0)
{
    image_xscale += m_growRate;
    image_yscale += m_growRate;
    if (m_growRate > 0 && image_xscale >= 2)
    {
        m_growRate = 0;
        image_xscale = 2;
        image_yscale = 2;
        m_process_page(page);
    }
    else if (m_growRate < 0 && image_xscale <= 0)
    {
        instance_destroy();
    }
}
else
{
    var _x_current = x - 264;
    var _y_current = y - 51;
    
    if (currentPageConfig.head != -1)
    {
        _x_current += 104;
        draw_sprite_ext(currentPageConfig.head, head_frame, x - 224, y, 2, 2, 0, c_white, 1);
    }
    
    var _swap_text = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.FONT_SWAP);
    draw_set_font(_swap_text ? m_DEFAULTS.font : currentPageConfig.font);
    
    var _wave_text = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.WAVE);
    var _wave = m_charWaveTimer;
    
    var _shake_text = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.SHAKE);
    if (currentPageConfig.font != fnt_papyrus_gui)
    {
        // To make the initial asterisk a different color, simply start your text as "@ffffff@aaaaaaMy text" (i.e., make an empty color to start)
        var _first_color = m_pageSegmentColors[0];
        draw_text_colour(
            _x_current + (_shake_text ? irandom_range(-1, 1) : 0), _y_current + (_shake_text ? irandom_range(-1, 1) : 0) + (_wave_text ? m_wave_offset(_wave) : 0),
            "*",
            _first_color, _first_color, _first_color, _first_color, 1
        );
        if (_wave_text)
        {
            _wave = m_increment_wave(_wave, 2);
        }
        _x_current += string_width("* ");
    }
    
    for (
        var _segment_index = 0, _segment_count = array_length(m_pageSegmentText), _total_char_count = 0;
        _segment_index < _segment_count && _total_char_count < charCount;
        ++_segment_index
    )
    {
        var _segment_text = m_pageSegmentText[_segment_index];
        var _segment_color = m_pageSegmentColors[_segment_index];
        for (
            var _char_index = 1, _segment_length = string_length(_segment_text);
            _char_index <= _segment_length && _total_char_count < charCount;
            ++_char_index
        )
        {
            ++_total_char_count;
            if (_swap_text)
            {
                var _swap_index = _total_char_count - 1;
                if (m_fontSwapTimers[_swap_index] > 0)
                {
                    --m_fontSwapTimers[_swap_index];
                }
            }
            
            var _char = string_char_at(_segment_text, _char_index);
            switch (_char)
            {
                case global.TEXT_FLAGS.NEWLINE_BUTTON:
                    _x_current = x - 264;
                    if (currentPageConfig.head != -1)
                    {
                        _x_current += 104;
                    }
                    _y_current += 35;
                    if (currentPageConfig.font != fnt_papyrus_gui)
                    {
                        draw_text_colour(
                            _x_current + (_shake_text ? irandom_range(-1, 1) : 0), _y_current + (_shake_text ? irandom_range(-1, 1) : 0) + (_wave_text ? m_wave_offset(_wave) : 0),
                            "*",
                            _segment_color, _segment_color, _segment_color, _segment_color, 1
                        );
                        if (_wave_text)
                        {
                            _wave = m_increment_wave(_wave, 2);
                        }
                        _x_current += string_width("* ");
                    }
                    break;
                case global.TEXT_FLAGS.NEWLINE:
                    _x_current = x - 264;
                    if (currentPageConfig.head != -1)
                    {
                        _x_current += 104;
                    }
                    if (currentPageConfig.font != fnt_papyrus_gui)
                    {
                        _x_current += string_width("* ");
                    }
                    _y_current += 35;
                    break;
                case global.TEXT_FLAGS.PAUSE:
                    // noop
                    break;
                case global.TEXT_FLAGS.ESCAPE:
                    ++_char_index;
                    if (_swap_text)
                    {
                        m_fontSwapTimers[_total_char_count] = m_fontSwapTimers[_total_char_count - 1];
                    }
                    ++_total_char_count;
                    _char = string_char_at(_segment_text, _char_index);
                    // fallthrough
                case global.TEXT_FLAGS.COLOR:
                default:
                    if (_swap_text)
                    {
                        var _swap_index = _total_char_count - 1;
                        if (m_fontSwapTimers[_swap_index] > 0)
                        {
                            draw_set_font(currentPageConfig.font);
                        }
                    }
                    draw_text_colour(
                        _x_current + (_shake_text ? irandom_range(-1, 1) : 0), _y_current + (_shake_text ? irandom_range(-1, 1) : 0) + (_wave_text ? m_wave_offset(_wave) : 0),
                        _char,
                        _segment_color, _segment_color, _segment_color, _segment_color, 1
                    );
                    if (_wave_text)
                    {
                        _wave = m_increment_wave(_wave, 1);
                    }
                    _x_current += string_width(_char);
                    break;
            }
        }
    }
    
    if (charCount >= m_charCountTarget)
    {
        var _arrow_color = c_white;
        var _rotation = (page < array_length(m_text) - 1) ? 0 : 90;
        if (currentPageConfig.choiceCount > 1)
        {
            _arrow_color = global.player.mabel ? scr_hexdec("CC277A") : scr_hexdec("3280ff");
            _rotation = 90;
            var _soul = global.player.mabel ? spr_soulM : spr_soul;
            var _x = x - 20;
            var _y = y - 2 + 35;
            switch m_choiceSelection
            {
                case 0: // left
                    _x = x - ((currentPageConfig.head == -1) ? 132 : 138);
                    if (currentPageConfig.choiceCount >= 3)
                    {
                        _y -= 35;
                    }
                    break;
                case 1: // right
                    _x = x + ((currentPageConfig.head == -1) ? 60 : 66);
                    if (currentPageConfig.choiceCount >= 3)
                    {
                        _y -= 35;
                    }
                    break;
                case 2: // up
                    _y -= 2 * 35;
                    break;
                case 3: // down
                    break;
            }
            draw_sprite(_soul, 0, _x, _y);
        }
        draw_sprite_ext(spr_moreText, m_continueArrowIndex, x + 270, y + 50, 3, 3, _rotation, _arrow_color, 1);
        head_frame = 0;
    }
    
    m_charWaveTimer = m_increment_wave(m_charWaveTimer, -1);
}
