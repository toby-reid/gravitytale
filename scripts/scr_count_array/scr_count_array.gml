function scr_count_array(_array, _item_to_count)
{
    var _count = 0;
    for (var i = 0, _array_length = array_length(_array); i < _array_length; ++i)
    {
        if (_array[i] == _item_to_count)
        {
            ++_count;
        }
    }
    return _count;
}
