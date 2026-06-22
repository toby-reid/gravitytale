function scr_pad_string(str, length, _alignment = fa_right, pad_char = " ")
{
    var _current_length = string_length(str);
    var _pad_length = length - _current_length;
    if (_pad_length <= 0)
    {
        return str;
    }
    if (string_length(pad_char) > 1)
    {
        pad_char = string_copy(pad_char, 1, 1);
    }
    switch (_alignment)
    {
        case fa_left:
            return string_concat(str, string_repeat(pad_char, _pad_length));
        case fa_center:
            return string_concat(string_repeat(pad_char, floor(_pad_length / 2)), str, string_repeat(pad_char, ceil(_pad_length / 2)));
        case fa_right:
        default:
            return string_concat(string_repeat(pad_char, _pad_length), str);
    }
}

function scr_join_strings(_base_string, _new_string, _new_index)
{
    var _base_length = string_length(_base_string);
    var _new_length = string_length(_new_string);
    var _base_return = _new_index + _new_length;
    var _padded_string = scr_pad_string(_base_string, _new_index - 1, fa_left);
    return string_concat(
        string_copy(_padded_string, 1, _new_index - 1),
        _new_string,
        string_copy(_base_string, _base_return, _base_length - _base_return)
    );
}

function scr_string_diff_index(_string_0, _string_1)
{
    var _smaller_length = min(string_length(_string_0), string_length(_string_1));
    for (var i = 1; i <= _smaller_length; ++i)
    {
        if (string_char_at(_string_0, i) != string_char_at(_string_1, i))
        {
            return i;
        }
    }
    return _smaller_length + 1;
}
