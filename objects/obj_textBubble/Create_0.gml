// @desc For reference:
// Fits 8 per row, 6 rows on index 0
// Fits ? per row, ? rows on index 1

image_xscale = 0;
image_yscale = 0;
m_growRate = 0.1;

event_inherited();

m_actions = [];
m_skippables = [];

page = 0;
charCount = 0;

m_charCountTarget = 0;
m_continueArrowIndex = 0;
m_continueArrowSpeed = 7;
m_pageSegmentText = [];
m_pageSegmentColors = [];
m_fontSwapTimers = [];
m_charWaveTimer = 0;

currentPageConfig = {
    font: fnt_basic_bubble,
    style: TEXT_STYLE.NONE,
    autosplit: true,
    sound: silence,
    action: undefined,
    charRate: 2,
    isSkippable: true
};
m_DEFAULTS = variable_clone(currentPageConfig);
m_CHAR_WAVES = {
    LIMIT: 16,
    SCALAR: 2
};

/// @desc Set actions to take when each page ends.
/// @param {Function|Array<Function>} _action_or_actions The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of the text array; unused when given an array
set_actions = function(_action_or_actions, _start_index = -1, _end_index = -1) { m_set_value("m_actions", _action_or_actions, m_DEFAULTS.action, _start_index, _end_index); }
/// @desc Set action for when the given index (page) ends.
/// @param {Real} _index The index at which to set the given value
/// @param {Function} _action The value to set at the given index
set_action = function(_index, _action) { set_actions(_action, _index, _index + 1); }

/// @desc Determine whether a given page range's text animations can be skipped with X/Shift (default, enabled).
/// @param {Bool|Array<Bool>} _skippable_or_skippables Whether this range (or each value therein, if an array) can be skipped
/// @param {Real} _start_index First index at which to set skippable (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set skippable (exclusive); omit to go to the end of text array
set_skippables = function(_skippable_or_skippables, _start_index = -1, _end_index = -1) { m_set_value("m_skippables", _skippable_or_skippables, m_DEFAULTS.isSkippable, _start_index, _end_index); }
/// @desc Set whether the given index can be skipped manually by the player.
/// @param {Real} _index The index at which to set the given value
/// @param {Bool} _is_skippable The value to set at the given index
set_skippable = function(_index, _is_skippable) { set_skippables(_is_skippable, _index, _index + 1); }

/// @desc Sets all relevant member variables, extracts colors and current page configurations, etc.
/// @param _page The index of `m_text` (and other mvar arrays) to process
m_process_page = function(_page)
{
    m_pageSegmentText = [];
    m_pageSegmentColors = [];

    var _page_text = m_text[_page];
    var _page_length = string_length(_page_text);

    var _segment_start = 1;
    var _current_color = c_black;
    currentPageConfig.autosplit = true;
    for (var _char_index = 1; _char_index < _page_length; ++_char_index)
    {
        switch string_char_at(_page_text, _char_index)
        {
            case global.TEXT_FLAGS.COLOR:
                if (_char_index != 1)
                {
                    array_push(m_pageSegmentText, string_copy(_page_text, _segment_start, _char_index - _segment_start));
                    array_push(m_pageSegmentColors, _current_color);
                    currentPageConfig.autosplit = false; // allow for autosplitting if the very beginning is color
                }
                _current_color = scr_hexdec(string_copy(_page_text, _char_index + 1, 6));
                _char_index += 6; // will be incremented once more at end of 'for' iteration
                _segment_start = _char_index + 1; // to account for the extra char_index increment after this iteration
                break;
            case global.TEXT_FLAGS.ESCAPE:
                var _next_char = string_char_at(_page_text, _char_index + 1);
                if (_next_char == global.TEXT_FLAGS.COLOR)
                {
                    // Remove the backslash
                    array_push(m_pageSegmentText, string_copy(_page_text, _segment_start, _char_index - _segment_start));
                    array_push(m_pageSegmentColors, _current_color);
                    _char_index += 1; // will be incremented once more at end of 'for' iteration
                    _segment_start = _char_index; // start it at the @
                }
                currentPageConfig.autosplit = false;
                break;
            case global.TEXT_FLAGS.NEWLINE:
            case global.TEXT_FLAGS.NEWLINE_BUTTON:
            case global.TEXT_FLAGS.PAUSE:
                currentPageConfig.autosplit = false;
                break;
        }
    }
    array_push(m_pageSegmentText, string_copy(_page_text, _segment_start, _page_length - _segment_start + 1));
    array_push(m_pageSegmentColors, _current_color);

    m_charCountTarget = scr_stringArray_length(m_pageSegmentText);

    currentPageConfig.font = scr_array_get(m_fonts, _page, m_DEFAULTS.font);
    currentPageConfig.style = scr_array_get(m_styles, _page, m_DEFAULTS.style);
    currentPageConfig.sound = scr_array_get(m_sounds, _page, m_DEFAULTS.sound);
    currentPageConfig.action = scr_array_get(m_actions, _page, m_DEFAULTS.action);
    currentPageConfig.charRate = scr_array_get(m_charRates, _page, m_DEFAULTS.charRate);
    currentPageConfig.isSkippable = scr_array_get(m_skippables, _page, m_DEFAULTS.isSkippable);
    if (currentPageConfig.style != TEXT_STYLE.NONE)
    {
        currentPageConfig.autosplit = false;
    }

    charCount = 0;
    m_fontSwapTimers = scr_has_enum_flag(currentPageConfig.style, TEXT_STYLE.FONT_SWAP) ? array_create(m_charCountTarget, 20) : [];

    alarm[0] = currentPageConfig.charRate;
    alarm[1] = m_continueArrowSpeed;
}

/// @desc Loads the next page or closes the text bubble if we've reached the end.
/// Also invokes this page's action, if relevant.
/// @return {Bool} Whether we've reached the end (and this bubble is going away)
next_page = function()
{
    if (is_callable(currentPageConfig.action))
    {
        currentPageConfig.action();
    }

    ++page;
    if (page >= array_length(m_text))
    {
        m_growRate = -0.1;
        return true;
    }
    m_process_page(page);
    return false;
}
