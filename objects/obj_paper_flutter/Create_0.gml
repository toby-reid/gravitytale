flutter_start = sprite_get_height(sprite_index);
flutter_width = sprite_get_width(sprite_index);

flutters = [];
add_flutter = function(_height, _x_scale)
{
    array_push(flutters, {
        size: _height,
        y_offset: flutter_start,
        y_endpoint: -_height,
        x_scale: _x_scale,
        width: flutter_width * _x_scale
    });
}

alarm[0] = 30;
