/// @desc Encrypts or decrypts the given string using the given key.
/// @param {String} _str: The message to encrypt or decrypt
/// @param {String} _key: The key to use for encryption or decryption
/// @return {String}: The encrypted or decrypted string
function scr_xorEncrypt(_str, _key)
{
    var str_len = string_length(_str);
    var key_len = string_length(_key);
    var encrypted_chars = array_create(str_len);
    for (var str_idx = 1; str_idx <= str_len; ++str_idx)
    {
        var str_char_code = string_ord_at(_str, str_idx);
        var key_char_code = string_ord_at(_key, str_idx mod key_len);
        encrypted_chars[str_idx - 1] = chr(str_char_code ^ key_char_code);
    }
    return string_join_ext("", encrypted_chars);
}
