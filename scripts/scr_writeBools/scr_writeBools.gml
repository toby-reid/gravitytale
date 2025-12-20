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
