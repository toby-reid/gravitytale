function scr_is_in_range(_value, _limit_0, _limit_1, _upper_exclusive = true)
{
    var _lower_limit = min(_limit_0, _limit_1);
    var _upper_limit = max(_limit_0, _limit_1);
    return _lower_limit <= _value && (_value < _upper_limit || (!_upper_exclusive && _value == _upper_limit));
}
