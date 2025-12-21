function scr_writeArray(_bin, _array, _write_func = scr_writeInteger)
{
    var arr_len = array_length(_array);
    scr_writeInteger(_bin, arr_len);
    for (var i = 0; i < arr_len; ++i)
    {
        _write_func(_bin, _array[i]);
    }
}

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
