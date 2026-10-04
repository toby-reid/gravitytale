draw_self();
for (var i = 0, _flutter_count = array_length(flutters); i < _flutter_count; ++i)
{
    var _flutter = flutters[i];
    var _draw_y = max(0, _flutter.y_offset);
    var _draw_height = (_flutter.y_offset < 0) ? (_flutter.size + _flutter.y_offset) : _flutter.size;
    draw_sprite_part_ext(
        sprite_index,
        image_index,
        0, _draw_y,
        flutter_width, _draw_height,
        x - sprite_xoffset - ((_flutter.width - flutter_width) div 2), y - sprite_yoffset + floor(image_yscale * _draw_y),
        _flutter.x_scale, image_yscale,
        c_white,
        1
    );
}
