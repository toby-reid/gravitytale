/// @desc Creates standard arrays and functions for text-displaying objects

m_text = [];
m_fonts = [];
m_styles = [];
m_sounds = [];
m_charRates = [];
currentPageConfig = {
    font: fnt_basic_gui,
    style: TEXT_STYLE.NONE,
    sound: silence,
    charRate: 2
};
m_DEFAULTS = variable_clone(currentPageConfig);

/// @desc Private method to set array-based variable value (does not work on array of arrays)
/// @param {String} _var_name The name of the variable to change (e.g., `m_text`)
/// @param {Array<Any>|Any} _new_data The new data to place at `_start_index`
/// @param {Real} _start_index Omit (or set negative) to replace entire array
/// @param {Any} _default The default value with which to populate values before the given start index
m_set_array = function(_var_name, _new_data, _start_index = -1, _default = -1)
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
    while (array_length(self[$ _var_name]) < _start_index)
    {
        self[$ _var_name][array_length(self[$ _var_name])] = _default;
    }
    var _new_length = array_length(_new_data);
    for (var i = 0; i < _new_length; ++i)
    {
        self[$ _var_name][_start_index + i] = _new_data[i];
    }
}
/// @desc Private method to set all values in a given range to the given value.
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
/// @desc Private method to set an array or range to the given value.
/// If the value is an array, only the start index (not the end) is considered.
/// @param {String} _var_name The name of the variable to change (e.g., `m_text`)
/// @param {Any|Array<Any>} _value_or_data The value with which to fill the range, or the array to set
/// @param {Any} _default The default value with which to populate values before the given range
/// @param {Real} _start_index The index at which to start the range (inclusive)
/// @param {Real} _end_index The index at which to end the range (exclusive); ignored for arrays
m_set_value = function(_var_name, _value_or_data, _default, _start_index = -1, _end_index = -1)
{
    var _is_single_value = !is_array(_value_or_data);
    if (_is_single_value)
    {
        m_set_range(_var_name, _value_or_data, _default, (_start_index < 0) ? 0 : _start_index, _end_index);
        return;
    }
    m_set_array(_var_name, _value_or_data, _start_index, _default);
}

/// @desc Set text at (or starting at) the given index.
/// @param {Array<String>|String} _new_text
/// @param {Real} _start_index Omit to replace *all* text
set_text = function(_new_text, _start_index = -1) { m_set_array("m_text", _new_text, _start_index, "(An error has occurred.&(Please report this!&(Code: @ff0000STTXT@ffffff)"); }

/// @desc Set font for all indices in range, or set as the given array.
/// @param {Asset.GMFont|Array<Asset.GMFont>} _font_or_fonts The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_fonts = function(_font_or_fonts, _start_index = -1, _end_index = -1) { m_set_value("m_fonts", _font_or_fonts, m_DEFAULTS.font, _start_index, _end_index); }
/// @desc Set font for the given index.
/// @param {Real} _index The index at which to set the given value
/// @param {Asset.GMFont} _font The value to set at the given index
set_font = function(_index, _font) { set_fonts(_font, _index, _index + 1); }

/// @desc Set text style for all indices in range, or set as the given array.
/// @param {Enum.TEXT_STYLE|Array<Enum.TEXT_STYLE>} _style_or_styles The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_styles = function(_style_or_styles, _start_index = -1, _end_index = -1) { m_set_value("m_styles", _style_or_styles, m_DEFAULTS.style, _start_index, _end_index); }
/// @desc Set text style for the given index.
/// @param {Real} _index The index at which to set the given value
/// @param {Enum.TEXT_STYLE} _style The value to set at the given index
set_style = function(_index, _style) { set_styles(_style, _index, _index + 1); }

/// @desc Set talking sound effect for all indices in range, or set as the given array.
/// @param {Asset.GMSound|Array<Asset.GMSound>} _sound_or_sounds The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_sounds = function(_sound_or_sounds, _start_index = -1, _end_index = -1) { m_set_value("m_sounds", _sound_or_sounds, m_DEFAULTS.sound, _start_index, _end_index); }
/// @desc Set talking sound effect for the given index.
/// @param {Real} _index The index at which to set the given value
/// @param {Asset.GMSound} _sound The value to set at the given index
set_sound = function(_index, _sound) { set_sounds(_sound, _index, _index + 1); }

/// @desc Set text animation rate (in terms of alarm values) for all indices in range, or set as the given array.
/// @param {Real|Array<Real>} _rate_or_rates The value to set for the given range, or the array to set starting at the given index
/// @param {Real} _start_index First index at which to set this value (inclusive); omit to perform on full text array
/// @param {Real} _end_index Last index at which to set this value (exclusive); omit to go to the end of text array; unused when given an array
set_charRates = function(_rate_or_rates, _start_index = -1, _end_index = -1) { m_set_value("m_charRates", _rate_or_rates, m_DEFAULTS.charRate, _start_index, _end_index); }
/// @desc Set text animation rate (in terms of alarm value) for the given index.
/// @param {Real} _index The index at which to set the given value
/// @param {Real} _rate The value to set at the given index
set_charRate = function(_index, _rate) { set_charRates(_rate, _index, _index + 1); }

/// @desc Skip the text animation, set charCount, etc.
skip_text = function()
{
    charCount = m_charCountTarget;
    // Easiest solution: Removes the need to change m_fontSwapTimers stuff
    currentPageConfig.style = scr_remove_enum_flag(currentPageConfig.style, TEXT_STYLE.FONT_SWAP);
    alarm[0] = currentPageConfig.charRate; // set it one last time in case of autocontinue
}
