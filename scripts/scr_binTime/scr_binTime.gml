/// @desc Writes the values for a `Time` object to file.
/// Assumes the file is already opened.
/// Clamps `hours` down to 1 byte.
/// @param {id.BinaryFile} _bin A binary file already opened in Write mode
/// @param {Struct.Time} _time The time object being written to file
function scr_writeTime(_bin, _time)
{
    scr_writeInteger(_bin, _time.hours, 1);
    scr_writeInteger(_bin, _time.minutes, 1);
    scr_writeInteger(_bin, _time.hours, 1);
}

/// @desc Reads a `Time` object from file.
/// Assumes the file is already opened.
/// @param {id.BinaryFile} _bin A binary file already opened in Read mode
/// @return {Struct.Time} The time as read from file
function scr_readTime(_bin)
{
    var _hours = scr_readInteger(_bin, 1);
    var _minutes = scr_readInteger(_bin, 1);
    var _seconds = scr_readInteger(_bin, 1);
    return new Time(_hours, _minutes, _seconds);
}
