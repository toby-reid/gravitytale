/// @desc Writes the given integer to the given binary file using the given byte count.
///       The user should confirm necessary byte count.
/// @param {id.BinaryFile} _bin: The binary file to write, already opened in Write mode
/// @param {Real} _int: The integer to write as binary
/// @param {Real} _byteCount: The number of bytes to write the integer as
function scr_writeInteger(_bin, _int, _byteCount = 1)
{
    for (var i = 1; i <= _byteCount; ++i)
    {
        var shift = (_byteCount - i) * global.BITS_PER_BYTE;
        file_bin_write_byte(_bin, (_int >> shift) & 0xff);
    }
}

/// @desc Reads an integer from the given binary file using the given byte count.
/// @param {id.BinaryFile} _bin: The binary file to read, already opened in Read mode
/// @param {Real} _byteCount: The number of bytes to read
/// @return {Real}: The integer read in from the binary file
function scr_readInteger(_bin, _byteCount = 1)
{
    var int = 0;
    for (var i = 1; i <= _byteCount; ++i)
    {
        int = (int << global.BITS_PER_BYTE) + file_bin_read_byte(_bin);
    }
    return int;
}
