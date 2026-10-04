// Iterate backward to avoid offsetting the indices
for (var i = array_length(flutters) - 1; i >= 0; --i)
{
    var _flutter = flutters[i];
    --_flutter.y_offset;
    if (_flutter.y_offset == _flutter.y_endpoint)
    {
        array_delete(flutters, i, 1);
    }
}
