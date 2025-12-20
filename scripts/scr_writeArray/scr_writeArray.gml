function scr_writeArray(_bin, _array, _write_func = scr_writeInteger)
{
    var arr_len = array_length(_array);
    scr_writeInteger(_bin, arr_len);
    for (var i = 0; i < arr_len; ++i)
    {
        _write_func(_bin, _array[i]);
    }
}