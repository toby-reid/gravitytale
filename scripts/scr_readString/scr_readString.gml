/// @desc Reads 2 bytes for string length, then reads a string that should end in a null terminator. Assumes the file is opened.
/// @param {id.BinaryFile} _bin: A binary file already opened in Read mode
/// @return {String}: The string read in. May return `none` if no string could be read
function scr_readString(_bin)
{
    var str_len = scr_readInteger(_bin, 2); // must match scr_writeBinaryString's byte count.
    var encrypted_chars = array_create(str_len);
    for (var i = 0; i < str_len; ++i)
    {
        encrypted_chars[i] = chr(file_bin_read_byte(_bin));
    }
    var str = scr_xorEncrypt(string_join_ext("", encrypted_chars), global.ENCRYPTION_KEY);
    if (!string_ends_with(str, "\0"))
    {
        // The string is invalid, or the improper key was used
        return pointer_null;
    }
    return string_copy(str, 1, str_len - 1);
}
