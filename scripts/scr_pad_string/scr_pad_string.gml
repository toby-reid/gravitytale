/// @desc Pads a string (or other object) with the given character.
/// @param {Any} _object The object to stringify and pad
/// @param {Real} _length The desired string length
/// @param {Constant.HAlign} _alignment Where the source string is located (default, `fa_right`, meaning padding is added to the left)
/// @param {String} _pad_char The character to use for padding (if length is more than 1, only the first character is used)
/// @return {String} A string of at least length `_length`
function scr_pad_string(_object, _length, _alignment = fa_right, _pad_char = " ")
{
    var _string = string(_object);
    var _current_length = string_length(_string);
    var _pad_length = _length - _current_length;
    if (_pad_length <= 0)
    {
        return _string;
    }

    var _pad_char_length = string_length(_pad_char);
    if (_pad_char_length == 0)
    {
        _pad_char = " ";
    }
    else if (_pad_char_length > 1)
    {
        _pad_char = string_char_at(_pad_char, 1);
    }

    switch (_alignment)
    {
        case fa_left:
            return string_concat(_string, string_repeat(_pad_char, _pad_length));
        case fa_center:
            var _odd_add = _pad_length % 2;
            _pad_length = _pad_length div 2;
            return string_concat(string_repeat(_pad_char, _pad_length), _string, string_repeat(_pad_char, _pad_length + _odd_add));
        case fa_right:
        default:
            return string_concat(string_repeat(_pad_char, _pad_length), _string);
    }
}

function scr_join_strings(_base_string, _new_string, _new_index)
{
    var _base_length = string_length(_base_string);
    var _new_length = string_length(_new_string);
    var _base_return = _new_index + _new_length;
    var _padded_string = scr_pad_string(_base_string, _new_index - 1, fa_left);
    var _joined_string = string_concat(
        string_copy(_padded_string, 1, _new_index - 1),
        _new_string,
        string_copy(_base_string, _base_return, _base_length)
    );
    return _joined_string;
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
