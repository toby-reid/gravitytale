/// @desc Retrieve the given array index, or the default value if out of range.
/// @param {Array<Any>} _array The array to seek/retrieve
/// @param {Real} _index The index of the array to seek/retrieve
/// @param {Any} _default The value to return if the index is out of range
/// @return {Any} The value at that index, or the default value if out of range
function scr_array_get(_array, _index, _default = undefined)
{
    return (_index < 0 || _index >= array_length(_array)) ? _default : _array[_index];
}
