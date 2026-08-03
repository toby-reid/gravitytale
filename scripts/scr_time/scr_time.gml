function Time(_hours = 0, _minutes = 0, _seconds = 0) constructor
{
    hours = _hours;
    minutes = _minutes;
    seconds = _seconds;
}

/// @desc Adds 1 second to the given time object, in-place.
/// @param {Struct.Time} _time The object to increment/modify
/// @param {Real} _cap_hours The maximum value for hours (exclusive) (i.e., the point at which `hours` resets to 0)
function scr_increment_time(_time, _cap_hours = undefined)
{
    ++_time.seconds;
    if (_time.seconds == 60)
    {
        _time.seconds = 0;
        ++_time.minutes;
        if (_time.minutes == 60)
        {
            _time.minutes = 0;
            ++_time.hours;
            if (!is_undefined(_cap_hours) && _time.hours == _cap_hours)
            {
                _time.hours = 0;
            }
        }
    }
}

/// @desc Formats and returns a time in the form `HH:MM:SS`.
/// @param {Struct.Time} _time The time object to format into a string (defaults to `global.player.time`)
/// @return {String} `HH:MM:SS`-format version of the given time
function scr_format_time(_time = global.player.time)
{
    return string_join(":", scr_pad_string(_time.hours, 2, fa_right, "0"), scr_pad_string(_time.minutes, 2, fa_right, "0"), scr_pad_string(_time.seconds, 2, fa_right, "0"));
}
