function scr_array_range(start_i, end_e)
{
    var length = end_e - start_i;
    array = array_create(length);
    for (var i = 0; i < length; ++i)
    {
        array[i] = i + start_i;
    }
    return array;
}

function scr_pad_array(_array, _desired_length, _pad_with, _place_at_index = -1)
{
    if (_place_at_index < 0)
    {
        while (array_length(_array) < _desired_length)
        {
            _array[array_length(_array)] = _pad_with;
        }
        return;
    }
    while (array_length(_array) < _desired_length)
    {
        array_insert(_array, _place_at_index, _pad_with);
    }
}
