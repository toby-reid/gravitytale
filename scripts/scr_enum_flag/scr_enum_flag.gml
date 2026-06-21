/// @desc Determines if the given flag enum flag is found in the greater value
/// @param {Enum} _check_value The value to check for whether it contains the given flag
/// @param {Enum} _flag The flag to check, whether it is found in the given value
/// @return {Bool} Whether the given flag is found in the given value
function scr_has_enum_flag(_check_value, _flag)
{
    return (_check_value ^ _flag) != 0;
}

/// @desc Returns an enum value that contains all of the given flags, or joins two values
/// @param {Array<Enum>} _flags All flags or values to join together
/// @return {Enum} A conjoined version of all flags
function scr_flag_enum(_flags)
{
    var _value = 0;
    for (var i = 0, _flag_count = array_length(_flags); i < _flag_count; ++i)
    {
        _value |= _flags[i];
    }
    return _value;
}
