/// @desc Determines the overall string length if the array elements were to be concatenated.
/// @param {Array<String>} _array Array of strings to determine overall length
/// @return {Real} Overall string length
function scr_stringArray_length(_array)
{
    // this way is faster/more efficient than a 'for' loop to increment
    // due to its use of native C++ code rather than JavaScript overhead
    return string_length(string_join_ext("", _array));
}

/// @desc Locates the character at the given index if the given array were one string.
/// @param {Array<String>} _array Array of strings to find char at `index`
/// @param {Real} _index String index (1-based) to look up
/// @return {String} Character at the given index, or an empty string if index out of range
function scr_stringArray_charAt(_array, _index)
{
    return string_char_at(string_join_ext("", _array), _index);
}
