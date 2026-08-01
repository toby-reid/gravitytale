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
