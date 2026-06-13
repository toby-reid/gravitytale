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