/// @desc For reference:
/// Max char count with no head: 31
/// Max char count with head: ??
/// Char count until Left (0) choice with no head: 7 spaces
/// Char count until Right (1) choice with no head: 19 (including whitespace leading up to Left choice)
/// Char count until Up (2) or Down (3) choice with no head: 14

if (x < 320)
{
    x *= 2;
    y *= 2;
}

image_xscale = 0;
image_yscale = 0;
m_growRate = 0.2;

m_text = [];
m_heads = [];
m_fonts = [];
m_styles = [];
m_sounds = [];
m_choiceCounts = [];
m_choiceActions = [];
m_charRates = [];
m_autoskips = [];
m_autocontinues = [];
m_skippables = [];

charCount = 0;
choices_made = [];
head_frame = 0;
page = 0;
auto_linebreak = false; // TODO: Implement auto newlines
setCanMove = false;
if (instance_exists(obj_dipper))
{
    setCanMove = obj_dipper.canMove;
    obj_dipper.canMove = false;
}

m_charCountTarget = 0;
m_continueArrowIndex = 0;
m_continueArrowSpeed = 7;
m_pageSegmentText = [];
m_pageSegmentColors = [];
m_fontSwapTimers = [];
m_charWaveTimer = 0; // used for the first character, to determine whether it's going up/down and for how long; positive is on the topside, negative on bottomside; 0-9 / -20--11 going up, 10-19 / -10--1 going down
m_choiceSelection = 0;

m_pageConfig = {
    head: -1,
    font: fnt_basic_gui,
    style: TEXT_STYLE.NONE,
    sound: tlk_default,
    choiceCount: 1,
    choiceActions: [],
    charRate: 2,
    autoskipAt: -1,
    autocontinue: false,
    isSkippable: true
};
m_DEFAULTS = variable_clone(m_pageConfig);
m_CHAR_WAVES = {
    LIMIT: 32,
    SCALAR: 4
}

/// @desc Private method to set array-based variable value (does not work on array of arrays)
/// @param {String} _var_name The name of the variable to change (e.g., `m_text`)
/// @param {Array<Any>|Any} _new_data The new data to place at `_start_index`
/// @param {Real} _start_index Omit (or set negative) to replace entire array
m_set_array = function(_var_name, _new_data, _start_index = -1)
{
    var _is_single_value = !is_array(_new_data);
    if (_start_index < 0)
    {
        // Replace array
        self[$ _var_name] = _is_single_value ? [_new_data] : _new_data;
        return;
    }
    if (_is_single_value)
    {
        self[$ _var_name][_start_index] = _new_data;
        return;
    }
    var _new_length = array_length(_new_data);
    for (var i = 0; i < _new_length; ++i)
    {
        self[$ _var_name][_start_index + i] = _new_data[i];
    }
}
/// @desc Private method to set all values in a given range to the given value
/// @param {String} _var_name The name of the variable to change (e.g., `m_text`)
/// @param {Any} _value The value with which to fill the range
/// @param {Any} _default The default value with which to populate values before the given range
/// @param {Real} _start_index The index at which to start the range (inclusive)
/// @param {Real} _end_index The index at which to end the range (exclusive); use negative for all `m_text` range
m_set_range = function(_var_name, _value, _default, _start_index, _end_index)
{
    while (array_length(self[$ _var_name]) < _start_index)
    {
        self[$ _var_name][array_length(self[$ _var_name])] = _default;
    }
    var _endex = (_end_index < 0) ? array_length(m_text) : _end_index;
    for (var i = _start_index; i < _endex; ++i)
    {
        self[$ _var_name][i] = _value;
    }
}

/// @desc Set text at (or starting at) the given index
/// @param {Array<String>|String} _new_text
/// @param {Real} _start_index Omit to replace *all* text
set_text = function(_new_text, _start_index = -1) { m_set_array("m_text", _new_text, _start_index); }

/// @desc Set faces at (or starting at) the given index
/// @param {Array<Asset.GMSprite>|Asset.GMSprite} _new_heads
/// @param {Real} _start_index Omit to set full head array
set_head = function(_new_heads, _start_index = -1) { m_set_array("m_heads", _new_heads, _start_index); }

/// @desc Set fonts at (or starting at) the given index
/// @param {Array<Asset.GMFont>|Asset.GMFont} _new_fonts
/// @param {Real} _start_index Omit to set full font array
set_fonts = function(_new_fonts, _start_index = -1) { m_set_array("m_fonts", _new_fonts, _start_index); }
/// @desc Set font for all values in range
/// @param {Asset.GMFont} _font The font to set
/// @param {Real} _start_index First index at which to set this font (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this font (exclusive); omit to go to the end of text array
set_font_range = function(_font, _start_index = 0, _end_index = -1) { m_set_range("m_fonts", _font, m_DEFAULTS.font, _start_index, _end_index); }

/// @desc Set text styles at (or starting at) the given index
/// @param {Array<Enum.TEXT_STYLE>|Enum.TEXT_STYLE} _new_styles Pass an enum or integer style ID
/// @param {Real} _start_index Omit to set full style array
set_styles = function(_new_styles, _start_index = -1) { m_set_array("m_styles", _new_styles, _start_index); }
/// @desc Set text style for all values in range
/// @param {Enum.TEXT_STYLE} _style The text style(s) to set
/// @param {Real} _start_index First index at which to set this style (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this style (exclusive); omit to go to the end of text array
set_style_range = function(_style, _start_index = 0, _end_index = -1) { m_set_range("m_styles", _style, m_DEFAULTS.style, _start_index, _end_index); }

/// @desc Set voice or sound effects at (or starting at) the given index
/// @param {Array<Asset.GMSound>|Asset.GMSound} _new_sounds
/// @param {Real} _start_index Omit to set full sound array
set_sounds = function(_new_sounds, _start_index = -1) { m_set_array("m_sounds", _new_sounds, _start_index); }
/// @desc Set sound for all values in range
/// @param {Asset.GMSound} _sound The `tlk_*` sound to set
/// @param {Real} _start_index First index at which to set this sound (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this sound (exclusive); omit to go to the end of text array
set_sound_range = function(_sound, _start_index = 0, _end_index = -1) { m_set_range("m_sounds", _sound, m_DEFAULTS.sound, _start_index, _end_index); }

/// @desc Set branch choice count at the given index
/// @param {Real} _index The index with choices
/// @param {Real} _choice_count Number of choices the player can use (supports 1-4, inclusive)
/// @param {Array<Function>} _actions_for_choices Optional actions to take depending on the choice (must be same length as `_choice_count`)
set_choiceCount = function(_index, _choice_count, _actions_for_choices = [])
{
    while (array_length(m_choiceCounts) < _index)
    {
        m_choiceCounts[array_length(m_choiceCounts)] = m_DEFAULTS.choiceCount;
    }
    m_choiceCounts[_index] = _choice_count;
    if (array_length(_actions_for_choices) > 0)
    {
        while (array_length(m_choiceActions) < _index)
        {
            m_choiceActions[array_length(m_choiceActions)] = m_DEFAULTS.choiceActions;
        }
        m_choiceActions[_index] = _actions_for_choices;
    }
}
/// @desc Set choices for the given index.
/// This will also modify `m_text`, autoskip, and (of course) choice counts for this index.
/// This function is not appropriate for use with strings with any special characters, such as pauses, newlines with bullets (`&`), colors (`@`), etc.
/// @param {Real} _index The index with choices
/// @param {Array<String>} _choices The actual choices. Indicate newline splits with `#`
/// @param {Array<Function>} _actions_for_choices Optional actions to take depending on the choice (must be same length as `_choices`)
set_choices = function(_index, _choices, _actions_for_choices = [])
{
    var _choice_count = array_length(_choices);
    set_choiceCount(_index, _choice_count, _actions_for_choices);
    
    // TODO: Account for special characters, like color...
    var _lineCount = 3; // max supported by textbox
    var _splitCount = _lineCount - 1;
    var _base_text = (array_length(m_text) > _index)
        ? scr_pad_array(string_split_ext(m_text[_index], [global.TEXT_FLAGS.NEWLINE, global.TEXT_FLAGS.NEWLINE_BUTTON], false, _splitCount), _lineCount, "")
        : array_create(_lineCount, "");
    
    var _has_up = _choice_count >= 3;
    var _has_down = _choice_count == 4;
    var _left = _has_down ? ["", _choices[0], ""] : scr_pad_array(string_split(_choices[0], global.TEXT_FLAGS.NEWLINE, false, _splitCount), _lineCount, "", 0);
    var _right = _has_down ? ["", _choices[1], ""] : scr_pad_array(string_split(_choices[1], global.TEXT_FLAGS.NEWLINE, false, _splitCount), _lineCount, "", 0);
    var _up = _has_down ? [_choices[2], "", ""] : (_has_up ? scr_pad_array(string_split(_choices[2], global.TEXT_FLAGS.NEWLINE, false, _splitCount), _lineCount, "") : array_create(_lineCount, ""));
    var _down = _has_down ? ["", "", _choices[3]] : array_create(_lineCount, "");
    
    var _padding = {
        left: 7,
        right: 19,
        up: 14,
        down: 14
    };
    var _final_text = array_create(_lineCount);
    for (var i = 0; i < _lineCount; ++i)
    {
        _final_text[i] =
            scr_join_strings(
                scr_join_strings(
                    scr_join_strings(
                        scr_join_strings(
                            _base_text[i],
                            _left[i],
                            _padding.left + 1
                        ),
                        _up[i],
                        _padding.up + 1
                    ),
                    _down[i],
                    _padding.down + 1
                ),
                _right[i],
                _padding.right + 1
            );
    }
    // TODO: account for NEWLINE_BUTTON as well
    var _new_string = string_join_ext(global.TEXT_FLAGS.NEWLINE, _final_text);
    set_autoskip(_index, scr_string_diff_index(m_text[_index], _new_string));
    m_text[_index] = _new_string;
}

/// @desc Set character typing speeds at (or starting at) the given index
/// @param {Array<Real>|Real} _new_char_rates Characters per frame or second
/// @param {Real} _start_index Omit to set full rate array
set_charRates = function(_new_char_rates, _start_index = -1) { m_set_array("m_charRates", _new_char_rates, _start_index); }
/// @desc Set char rate for all values in range
/// @param {Real} _char_rate The char rate to set
/// @param {Real} _start_index First index at which to set this char rate (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this char rate (exclusive); omit to go to the end of text array
set_charRate_range = function(_char_rate, _start_index = 0, _end_index = -1) { m_set_range("m_charRates", _char_rate, m_DEFAULTS.charRate, _start_index, _end_index); }

/// @desc Determine whether a given page's text animation can be skipped with X/Shift (default, enabled)
/// @param {Bool} _is_skippable Whether this page is skippable
/// @param {Real} _page Page index to determine skippability (0-indexed); omit to set for all pages
set_skippable = function(_is_skippable = true, _page = -1)
{
    if (_page < 0)
    {
        for (var i = 0, _page_count = array_length(m_text); i < _page_count; ++i)
        {
            m_skippables[i] = _is_skippable;
        }
        return;
    }
    while (array_length(m_skippables) < _page)
    {
        m_skippables[array_length(m_skippables)] = m_DEFAULTS.isSkippable;
    }
    m_skippables[_page] = _is_skippable;
}
/// @desc When the given page reaches the given index, skip the remainder of the text animation and jump to the finished product
/// @param {Real} _on_page Page index at which this autoskip takes effect (0-indexed; array); omit to skip text on all pages
/// @param {Real} _at_page_index Character index on that page at which to skip (1-indexed; string); omit to skip entire page
set_autoskip = function(_on_page = -1, _at_page_index = 1)
{
    if (_on_page < 0)
    {
        for (var i = 0, _page_count = array_length(m_text); i < _page_count; ++i)
        {
            m_autoskips[i] = _at_page_index;
        }
        return;
    }
    while (array_length(m_autoskips) < _on_page)
    {
        m_autoskips[array_length(m_autoskips)] = m_DEFAULTS.autoskipAt;
    }
    m_autoskips[_on_page] = _at_page_index;
}
/// @desc When the given page finishes text animation, immediately move to the next page (or dismiss textbox).
/// Recommended to set skippable false for each index, hence the convenient flag.
/// @param {Real} _on_page Page index where the text does not wait for user input (immediately proceeds); omit to continue on all pages
/// @param {Bool} _set_unskippable Whether to set this page as not manually skippable
set_autocontinue = function(_on_page = -1, _set_unskippable = true)
{
    if (_on_page < 0)
    {
        for (var i = 0, _page_count = array_length(m_text); i < _page_count; ++i)
        {
            m_autocontinues[i] = true;
            if (_set_unskippable)
            {
                m_skippables[i] = false;
            }
        }
        return;
    }
    while (array_length(m_autocontinues) < _on_page)
    {
        m_autocontinues[array_length(m_autocontinues)] = m_DEFAULTS.autocontinue;
    }
    m_autocontinues[_on_page] = true;
    if (_set_unskippable)
    {
        set_skippable(false, _on_page);
    }
}


m_process_page = function(_page)
{
    // TODO: Auto-newline if enabled
    m_pageSegmentText = [];
    m_pageSegmentColors = [];
    
    var _page_text = m_text[_page];
    var _page_length = string_length(_page_text);
    
    var _skipPageAt = (array_length(m_autoskips) > _page) ? m_autoskips[_page] : -1;
    m_pageConfig.autoskipAt = _skipPageAt;
    
    var _segment_start = 1;
    var _current_color = c_white;
    for (var _char_index = 1; _char_index < _page_length; ++_char_index)
    {
        switch string_char_at(_page_text, _char_index)
        {
            case global.TEXT_FLAGS.COLOR:
                if (_char_index != 1)
                {
                    // Treat it special if this is the first character - don't make an extra segment for nothing
                    // This also enables the initial * to be displayed with color
                    m_pageSegmentText[array_length(m_pageSegmentText)] = string_copy(_page_text, _segment_start, _char_index - _segment_start);
                    m_pageSegmentColors[array_length(m_pageSegmentColors)] = _current_color;
                }
                _current_color = scr_hexdec(string_copy(_page_text, _char_index + 1, 6));
                _char_index += 6;
                _segment_start = _char_index + 1;
                if (_skipPageAt >= _segment_start)
                {
                    m_pageConfig.autoskipAt -= 7;
                }
                break;
            case global.TEXT_FLAGS.ESCAPE:
                var _next_char = string_char_at(_page_text, _char_index + 1);
                if (_next_char == global.TEXT_FLAGS.COLOR)
                {
                    m_pageSegmentText[array_length(m_pageSegmentText)] = string_concat(string_copy(_page_text, _segment_start, _char_index - _segment_start), _next_char);
                    m_pageSegmentColors[array_length(m_pageSegmentColors)] = _current_color;
                    ++_char_index;
                    _segment_start = _char_index + 1;
                    if (_skipPageAt >= _segment_start)
                    {
                        --m_pageConfig.autoskipAt;
                    }
                }
                break;
        }
    }
    m_pageSegmentText[array_length(m_pageSegmentText)] = string_copy(_page_text, _segment_start, _page_length - _segment_start + 1);
    m_pageSegmentColors[array_length(m_pageSegmentColors)] = _current_color;
    
    m_charCountTarget = 0;
    for (var i = 0, _segment_count = array_length(m_pageSegmentText); i < _segment_count; ++i)
    {
        m_charCountTarget += string_length(m_pageSegmentText[i]);
    }
    
    m_pageConfig.head = (array_length(m_heads) > _page) ? m_heads[_page] : m_DEFAULTS.head;
    m_pageConfig.font = (array_length(m_fonts) > _page) ? m_fonts[_page] : m_DEFAULTS.font;
    m_pageConfig.style = (array_length(m_styles) > _page) ? m_styles[_page] : m_DEFAULTS.style;
    m_pageConfig.sound = (array_length(m_sounds) > _page) ? m_sounds[_page] : m_DEFAULTS.sound;
    m_pageConfig.choiceCount = (array_length(m_choiceCounts) > _page) ? m_choiceCounts[_page] : m_DEFAULTS.choiceCount;
    m_pageConfig.choiceActions = (array_length(m_choiceActions) > _page) ? m_choiceActions[_page] : m_DEFAULTS.choiceActions;
    m_pageConfig.charRate = (array_length(m_charRates) > _page) ? m_charRates[_page] : m_DEFAULTS.charRate;
    // autoskip already set along with colors
    m_pageConfig.autocontinue = (array_length(m_autocontinues) > _page) ? m_autocontinues[_page] : m_DEFAULTS.autocontinue;
    m_pageConfig.isSkippable = (array_length(m_skippables) > _page) ? m_skippables[_page] : m_DEFAULTS.isSkippable;
    
    charCount = 0;
    m_choiceSelection = 0;
    m_fontSwapTimers = scr_has_enum_flag(m_pageConfig.style, TEXT_STYLE.FONT_SWAP) ? array_create(m_charCountTarget, 20) : [];
    
    alarm[0] = m_pageConfig.charRate;
    alarm[1] = m_continueArrowSpeed;
}

/// @desc Retrieves the character found at the given index of the current page, accounting for all page segments
/// @param {Real} _index 1-based index for the character to locate
/// @return {String} The character at the given index; raises an error if no such character
m_char_at = function(_index)
{
    var _remaining = _index;
    for (var _segment_index = 0, _segment_count = array_length(m_pageSegmentText); _segment_index < _segment_count; ++_segment_index)
    {
        var _segment_length = string_length(m_pageSegmentText[_segment_index]);
        if (_segment_length > _remaining)
        {
            return string_char_at(m_pageSegmentText[_segment_index], _remaining);
        }
        _remaining -= _segment_length;
    }
    // Allow a GMS2 error otherwise... something went wrong
}

/// @desc Skip the text animation, set charCount, etc.
skip_text = function()
{
    charCount = m_charCountTarget;
    if (scr_has_enum_flag(m_pageConfig.style, TEXT_STYLE.FONT_SWAP))
    {
        for (var i = 0, _timers_length = array_length(m_fontSwapTimers); i < _timers_length; ++i)
        {
            m_fontSwapTimers[i] = 0;
        }
    }
    alarm[0] = m_pageConfig.charRate; // set it one last time in case of autocontinue
}

/// @desc Determines a text-wave Y-offset
/// @param {Real} _wave The "wave" value, which should be between positive and negative `m_CHAR_WAVES.LIMIT` (positive limit exclusive)
/// @return {Real} The Y-offset to use for this character based on that wave value
m_wave_offset = function(_wave)
{
    var _peak = (m_CHAR_WAVES.LIMIT div m_CHAR_WAVES.SCALAR) div 2;
    if (_wave < 0)
    {
        var _wave_strength = (_wave + m_CHAR_WAVES.LIMIT) div m_CHAR_WAVES.SCALAR;
        return abs(_wave_strength - _peak) - _peak; // abs(wave_strength + 2*peak - peak) - peak
    }
    var _wave_strength = _wave div m_CHAR_WAVES.SCALAR;
    return _peak - abs(_peak - _wave_strength);
}
/// @desc Increments a wave value in either direction, wrapping to fit within limits as necessary
/// @param {Real} _wave The "wave" value to modify
/// @param {Real} _direction The incremental value to add to `_wave` (default `1` to increment)
/// @return {Real} The new "wave" value that can then be assigned
m_increment_wave = function(_wave, _direction = 1)
{
    var _new_wave = _wave + _direction;
    while (_new_wave >= m_CHAR_WAVES.LIMIT)
    {
        _new_wave -= 2 * m_CHAR_WAVES.LIMIT;
    }
    while (_new_wave < -m_CHAR_WAVES.LIMIT)
    {
        _new_wave += 2 * m_CHAR_WAVES.LIMIT;
    }
    return _new_wave;
}

/// @desc Loads the next page or closes the textbox if we've reached the end.
/// Also invokes any choice actions if relevant
/// @return {Bool} Whether we've reached the end (and this textbox is going away)
next_page = function()
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
    if (page == array_length(m_text))
    {
        m_growRate = -0.2;
        return true;
    }
    m_process_page(page);
    return false;
}
