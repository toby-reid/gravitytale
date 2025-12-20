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
