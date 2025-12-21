/// @desc Writes the given boolean values using as many bytes as needed, with 1 bit per bool, potentially with leading 0 bits.
/// @param {id.BinaryFile} _bin: The binary file to write, already opened in Write mode
/// @param {Array<Bool>} _bools: The boolean values to write, 1 bit for each
function scr_writeBools(_bin, _bools)
{
    var int = 0;
    var bool_count = array_length(_bools);
    for (var i = 0; i < bool_count; ++i)
    {
        int = (int << 1) + (_bools[i] ? 1 : 0);
    }
    var byte_count = ceil(bool_count / global.BITS_PER_BYTE);
    scr_writeInteger(_bin, int, byte_count);
}

/// @desc Reads the given number of boolean values, with 1 bit per bool, potentially with leading 0 bits (depending on the bool count).
/// @param {id.BinaryFile} _bin: The binary file to read, already opened in Read mode
/// @param {Real} _bool_count: The number of boolean values that were saved
/// @return {Array<Bool>}: _bool_count boolean values that were read in
function scr_readBools(_bin, _bool_count)
{
    var byte_count = ceil(_bool_count / global.BITS_PER_BYTE);
    var int = scr_readInteger(_bin, byte_count);
    var bools = array_create(_bool_count, false);
    for (var i = _bool_count - 1; i >= 0; --i)
    {
        bools[i] = (int & 1) == 1;
        int = int >> 1;
    }
    return bools;
}
