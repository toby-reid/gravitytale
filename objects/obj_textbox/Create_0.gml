/// @desc For reference:
/// Max char count with no head: 31
/// Max char count with head: 25
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

event_inherited();

m_heads = [];
m_choiceCounts = [];
m_actions = [];
m_cancelActions = [];
m_autoskips = [];
m_autocontinues = [];
m_skippables = [];

charCount = 0;
choices_made = [];
head_frame = 0;
page = 0;
setCanMove = false;
if (instance_exists(obj_dipper))
{
    setCanMove = obj_dipper.canMove;
    obj_dipper.canMove = false;
}

m_charCountTarget = 0;
m_continueArrowIndex = 0;
m_continueArrowSpeed = 7;
m_choiceSelection = 0;

currentPageConfig = {
    head: -1,
    font: fnt_basic_gui,
    style: TEXT_STYLE.NONE,
    sound: tlk_default,
    choiceCount: 1,
    actions: [],
    cancelAction: undefined,
    charRate: 2,
    autoskipAt: -1,
    autocontinue: false,
    isSkippable: true
};
m_DEFAULTS = variable_clone(currentPageConfig);

/// @desc Set head for all indices in range, or set as the given array.
/// @param {Asset.GMSprite|Array<Asset.GMSprite>} _head_or_heads The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value the index at which to start this array (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_heads = function(_head_or_heads, _start_index = -1, _end_index = -1) { m_set_value("m_heads", _head_or_heads, m_DEFAULTS.head, _start_index, _end_index); }
/// @desc Set head for the given index.
/// @param {Real} _index The index at which to set the given value
/// @param {Asset.GMSprite} _head The value to set at the given index
set_head = function(_index, _head) { set_heads(_head, _index, _index + 1); }

/// @desc Set number of choices for all indices in range, or set as the given array.
/// @param {Real|Array<Real>} _count_or_counts The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_choiceCounts = function(_count_or_counts, _start_index = -1, _end_index = -1) { m_set_value("m_choiceCounts", _count_or_counts, m_DEFAULTS.choiceCount, _start_index, _end_index); }
/// @desc Set number of choices for the given index.
/// @param {Real} _index The index at which to set the given value
/// @param {Real} _count The value to set at the given index
set_choiceCount = function(_index, _count) { set_choiceCounts(_count, _index, _index + 1); }

/// @desc Set action to take when the given index (page) ends (either by autocontinue or user continue action).
/// **Does not modify choice count.**
/// # Warning
/// This function is not equipped to take an array of arrays (i.e., an array containing actions for each step).
/// To do that, use `set_actions_all`.
/// @param {Real} _index Page at which to set the given action(s)
/// @param {Function|Array<Function>} _action_or_actions Action or actions to take at the end of the given page
set_actions = function(_index, _action_or_actions)
{
    var _actions = is_callable(_action_or_actions) ? [_action_or_actions] : _action_or_actions;
    m_set_range("m_actions", _actions, m_DEFAULTS.actions, _index, _index + 1);
}
/// @desc Set action or actions to take at each page (corresponding with `m_text`).
/// **Does not modify choice count.**
/// # Warning
/// This function takes an array of arrays (i.e., an array containing actions for each step); it **does not** take the actual actions array.
/// To do that, use `set_actions`.
/// @param {Array<Function|Undefined|Array<Function|Undefined>>} _all_actions Array of actions for each page. If the value at any `_actions` index is a function, it will be the *only* action for that page
/// @param {Real} _start_index The index at which to start inserting the given actions (omit to replace entire array)
set_actions_all = function(_all_actions, _start_index = -1)
{
    var _all_actions_length = array_length(_all_actions);
    var _start = _start_index;
    if (_start_index < 0)
    {
        m_actions = array_create(_all_actions_length, m_DEFAULTS.actions);
        _start = 0;
    }
    for (var i = 0; i < _all_actions_length; ++i)
    {
        var _actions = _all_actions[i];
        if (!is_undefined(_actions))
        {
            set_actions(_start + i, _actions);
        }
    }
}

/// @desc Set action to take when the user presses the cancel/skip button (X/ENTER) when text is already full.
/// Especially useful for choices.
/// @param {Real} _index Page at which to set the given action
/// @param {Function} _action Action to take on a cancel event
set_cancelAction = function(_index, _action)
{
    m_set_range("m_cancelActions", _action, m_DEFAULTS.cancelAction, _index, _index + 1);
}
/// @desc Set actions to take when the user presses the cancel/skip button when text is already full at each respective page.
/// @param {Array<Function|Undefined>} _all_actions Array of actions for each page
/// @param {Real} _start_index The index at which to start inserting the given actions (omit to replace entire array)
set_cancelAction_all = function(_all_actions, _start_index = -1)
{
    var _all_actions_length = array_length(_all_actions);
    var _start = _start_index;
    if (_start_index < 0)
    {
        m_cancelActions = array_create(_all_actions_length, m_DEFAULTS.cancelAction);
        _start = 0;
    }
    for (var i = 0; i < _all_actions_length; ++i)
    {
        var _action = _all_actions[i];
        if (!is_undefined(_action))
        {
            set_cancelAction(_start + i, _action);
        }
    }
}

/// @desc Set choices for the given index.
/// This will also modify `m_text`, autoskip, and (of course) choice counts for this index.
/// This function is not appropriate for use with strings with any special characters, such as pauses, newlines with bullets (`&`), colors (`@`), etc.
/// @param {Real} _index The index with choices
/// @param {Array<String>} _choices The actual choices. Indicate newline splits with `#`
/// @param {Array<Function>} _actions_for_choices Optional actions to take depending on the choice (must be same length as `_choices`)
/// @param {Function|Undefined} _cancel_action Optional action to take if the user hits the cancel key (`X` or `ENTER`)
set_choices = function(_index, _choices, _actions_for_choices = [], _cancel_action = undefined)
{
    if (array_length(_actions_for_choices) > 0)
    {
        set_actions(_index, _actions_for_choices);
    }
    if (!is_undefined(_cancel_action))
    {
        set_cancelAction(_index, _cancel_action);
    }
    var _choice_count = array_length(_choices);
    set_choiceCount(_index, _choice_count);
    
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

/// @desc Determine whether a given page range's text animations can be skipped with X/Shift (default, enabled).
/// @param {Bool|Array<Bool>} _skippable_or_skippables Whether this range (or each value therein, if an array) can be skipped
/// @param {Real} _start_index First index at which to set skippable (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set skippable (exclusive); omit to go to the end of text array
set_skippables = function(_skippable_or_skippables, _start_index = -1, _end_index = -1) { m_set_value("m_skippables", _skippable_or_skippables, m_DEFAULTS.isSkippable, _start_index, _end_index); }
/// @desc Set whether the given index can be skipped manually by the player.
/// @param {Real} _index The index at which to set the given value
/// @param {Bool} _is_skippable The value to set at the given index
set_skippable = function(_index, _is_skippable) { set_skippables(_is_skippable, _index, _index + 1); }

/// @desc Set autoskip text index for all pages in range, or set as the given array.
/// @param {Real|Array<Real>} _skipAt_or_skipAts The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_autoskips = function(_skipAt_or_skipAts, _start_index = -1, _end_index = -1) { m_set_value("m_autoskips", _skipAt_or_skipAts, m_DEFAULTS.autoskipAt, _start_index, _end_index); }
/// @desc When the given page reaches the given index, skip the remainder of the text animation and jump to the finished product.
/// @param {Real} _on_page Page index at which this autoskip takes effect (0-indexed; array); omit to skip text on all pages
/// @param {Real} _at_page_index Character index on that page at which to skip (1-indexed; string); omit to skip entire page
set_autoskip = function(_on_page = -1, _at_page_index = 1) { set_autoskips(_at_page_index, _on_page, _on_page + 1); }

/// @desc Determine whether a given page range automatically continues to the next page when its animation finishes.
/// Recommended to set each page as unskippable as well.
/// @param {Bool|Array<Bool>} _autocontinue_or_autocontinues Whether this range (or each value therein, if an array) automagically continues
/// @param {Real} _start_index First index at which to set skippable (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set skippable (exclusive); omit to go to the end of text array
set_autocontinues = function(_autocontinue = true, _start_index = -1, _end_index = -1) { m_set_value("m_autocontinues", _autocontinue, m_DEFAULTS.autocontinue, _start_index, _end_index); }
/// @desc Determines whether the given page automatically continues to the next when its animation finishes.
/// Recommended to set each autocontinue page as unskippable.
/// @param {Real} _index The index at which to set the given value
/// @param {Bool} _autocontinue The value to set at the given index
set_autocontinue = function(_index, _autocontinue = true) { set_autocontinues(_autocontinue, _index, _index + 1); }


/// @desc Sets all relevant member variables, extracts colors and current page configurations, alarm values, etc.
/// @param _page The index of `m_text` (and other member-variable arrays) to process
m_process_page = function(_page)
{
    m_pageSegmentText = [];
    m_pageSegmentColors = [];
    
    var _page_text = m_text[_page];
    var _page_length = string_length(_page_text);
    
    var _skipPageAt = (array_length(m_autoskips) > _page) ? m_autoskips[_page] : -1;
    currentPageConfig.autoskipAt = _skipPageAt;
    
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
                    array_push(m_pageSegmentText, string_copy(_page_text, _segment_start, _char_index - _segment_start));
                    array_push(m_pageSegmentColors, _current_color);
                }
                _current_color = scr_hexdec(string_copy(_page_text, _char_index + 1, 6));
                _char_index += 6;
                _segment_start = _char_index + 1;
                if (_skipPageAt >= _segment_start)
                {
                    currentPageConfig.autoskipAt -= 7;
                }
                break;
            case global.TEXT_FLAGS.ESCAPE:
                var _next_char = string_char_at(_page_text, _char_index + 1);
                if (_next_char == global.TEXT_FLAGS.COLOR)
                {
                    array_push(m_pageSegmentText, string_copy(_page_text, _segment_start, _char_index - _segment_start));
                    array_push(m_pageSegmentColors, _current_color);
                    ++_char_index;
                    _segment_start = _char_index;
                    if (_skipPageAt >= _segment_start)
                    {
                        --currentPageConfig.autoskipAt;
                    }
                }
                break;
        }
    }
    array_push(m_pageSegmentText, string_copy(_page_text, _segment_start, _page_length - _segment_start + 1));
    array_push(m_pageSegmentColors, _current_color);
    
    m_charCountTarget = scr_stringArray_length(m_pageSegmentText);
    
    currentPageConfig.head = scr_array_get(m_heads, _page, m_DEFAULTS.head);
    currentPageConfig.font = scr_array_get(m_fonts, _page, m_DEFAULTS.font);
    currentPageConfig.style = scr_array_get(m_styles, _page, m_DEFAULTS.style);
    currentPageConfig.sound = scr_array_get(m_sounds, _page, m_DEFAULTS.sound);
    currentPageConfig.choiceCount = scr_array_get(m_choiceCounts, _page, m_DEFAULTS.choiceCount);
    currentPageConfig.actions = scr_array_get(m_actions, _page, m_DEFAULTS.actions);
    currentPageConfig.cancelAction = scr_array_get(m_cancelActions, _page, m_DEFAULTS.cancelAction);
    currentPageConfig.charRate = scr_array_get(m_charRates, _page, m_DEFAULTS.charRate);
    // autoskip already set along with colors
    currentPageConfig.autocontinue = scr_array_get(m_autocontinues, _page, m_DEFAULTS.autocontinue);
    currentPageConfig.isSkippable = scr_array_get(m_skippables, _page, m_DEFAULTS.isSkippable);
    
    charCount = 0;
    m_choiceSelection = 0;
    m_fontSwapTimers = m_make_fontSwapTimers(m_charCountTarget);
    
    alarm[0] = currentPageConfig.charRate;
    alarm[1] = m_continueArrowSpeed;
}

/// @desc Loads the next page or closes the textbox if we've reached the end.
/// Also invokes any choice actions if relevant.
/// @param {Bool} _perform_actions Whether to perform customary actions (particularly useful for Cancel action)
/// @return {Bool} Whether we've reached the end (and this textbox is going away)
next_page = function(_perform_actions = true)
{
    // Allow for taking an action even without choices
    if (_perform_actions && array_length(currentPageConfig.actions) > m_choiceSelection)
    {
        var _action = currentPageConfig.actions[m_choiceSelection];
        if (is_callable(_action))
        {
            _action();
        }
    }
    if (currentPageConfig.choiceCount > 1)
    {
        while (array_length(choices_made) < page)
        {
            choices_made[array_length(choices_made)] = 0;
        }
        choices_made[page] = m_choiceSelection;
    }

    ++page;
    if (page >= array_length(m_text))
    {
        m_growRate = -0.2;
        return true;
    }
    m_process_page(page);
    return false;
}
/// @desc Loads the next page without performing actions.
/// Used as a shortcut for `next_page(false)`.
/// @return {Bool} Whether we've reached the end (and this textbox is going away)
skip_page = function()
{
    return next_page(false);
}
