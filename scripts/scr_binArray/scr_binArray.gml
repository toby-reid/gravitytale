/// @desc Writes a full array to a binary file using the given function to write each element.
/// @param {Id.BinaryFile} _bin: A binary file opened in write mode
/// @param {Array<Any>} _array: An array of objects to write to file
/// @param {Function(Id.BinaryFile, Any) -> Undefined} _write_func: The function to use to write each array element
function scr_writeArray(_bin, _array, _write_func = scr_writeInteger)
{
    var arr_len = array_length(_array);
    scr_writeInteger(_bin, arr_len);
    for (var i = 0; i < arr_len; ++i)
    {
        _write_func(_bin, _array[i]);
    }
}

/// @desc Reads an array from a binary file using the given function to read each element.
/// @param {Id.BinaryFile} _bin: A binary file opened in read mode
/// @param {Function(Id.BinaryFile) -> Any} _read_func: The function to use to read each array element
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
