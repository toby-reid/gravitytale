function scr_pad_string(str, length, pad_char = " ")
{
    var _current_length = string_length(str);
    var _pad_length = length - _current_length;
    if (_pad_length == 0)
    {
        return str;
    }
    if (_pad_length < 0)
    {
        return string_copy(str, 1, length);
    }
    if (string_length(pad_char) > 1)
    {
        pad_char = string_copy(pad_char, 1, 1);
    }
    return string_concat(string_repeat(pad_char, _pad_length), str);
}
