/// @desc Writes 2 bytes for string length, then each character in the string as a byte. Assumes the file is already opened.
/// @param {id.BinaryFile} _bin: A binary file already opened in Write mode
/// @param {String} _str: The string whose data are being written
function scr_writeString(_bin, _str)
{
    var encrypted_str = scr_xorEncrypt(string_concat(_str, "\0"), global.ENCRYPTION_KEY);
    var str_len = string_length(encrypted_str);
    // I don't anticipate strings going very long, but just to be safe, do 2^16 bits (2 bytes)
    scr_writeInteger(_bin, str_len, 2); // must match scr_readBinaryString's byte count.
    for (var i = 1; i <= str_len; ++i)
    {
        file_bin_write_byte(_bin, string_ord_at(encrypted_str, i));
    }
}
