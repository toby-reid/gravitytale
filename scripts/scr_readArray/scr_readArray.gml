function scr_readArray(_bin, _read_func = scr_readInteger)
{
    var arr_len = scr_readInteger(_bin);
    var array = array_create(arr_len);
    for (var i = 0; i < arr_len; ++i)
    {
        array[i] = _read_func(_bin);
    }
    return array;
}