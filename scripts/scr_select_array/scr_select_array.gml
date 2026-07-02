/// @desc Finds an index that matches the given criteria, returning `_start_index` if none is found.
/// @param {Array<Any>} _array The array to search for a matching index
/// @param {Function} _criteria Function that takes an array element and returns `true` if valid
/// @param {Bool} _seek_backward Set `true` to seek backward through the array instead of forward
/// @param {Real} _start_index The current selection from which to start the search. Leave blank to start at the beginning (or end, if backward)
/// @param {Bool} _include_start Set `true` to include the `_start_index` with the rest of the search (by default, starts search on the next index)
/// @return {Real} The new selection index. If nothing matched the given criteria function, returns `_start_index`
function scr_select_array(_array, _criteria, _seek_backward = false, _start_index = -1, _include_start = false)
{
    var _arr_length = array_length(_array);
    if (_seek_backward)
    {
        var _start_at = _arr_length - 1;
        if (_start_index >= 0 && _start_index < _arr_length)
        {
            _start_at = _start_index;
            if (!_include_start)
            {
                --_start_at;
            }
        }
        for (var i = _start_at; i >= 0; --i)
        {
            if (_criteria(_array[i]))
            {
                return i;
            }
        }
        for (var i = _arr_length - 1; i > _start_at; --i)
        {
            if (_criteria(_array[i]))
            {
                return i;
            }
        }
    }
    else
    {
        var _start_at = 0;
        if (_start_index >= 0 && _start_index < _arr_length)
        {
            _start_at = _start_index;
            if (!_include_start)
            {
                ++_start_at;
            }
        }
        for (var i = _start_at; i < _arr_length; ++i)
        {
            if (_criteria(_array[i]))
            {
                return i;
            }
        }
        for (var i = 0; i < _start_at; ++i)
        {
            if (_criteria(_array[i]))
            {
                return i;
            }
        }
    }
    return _start_index;
}
