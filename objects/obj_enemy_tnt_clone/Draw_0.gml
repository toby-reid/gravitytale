event_inherited();
if (deathx == 0 && image_xscale == 2)
{
    for (var i = 0, _flutter_count = array_length(flutters); i < _flutter_count; ++i)
    {
        var _flutter = flutters[i];
        var _draw_y = max(0, _flutter.y_offset);
        var _draw_height = (_flutter.y_offset < 0) ? (_flutter.size + _flutter.y_offset) : _flutter.size;
        draw_sprite_part_ext(
            sprite_index,
            image_index,
            0, _draw_y,
            unscaled_width, _draw_height,
            x - sprite_xoffset - ((_flutter.width - unscaled_width) div 2), y - sprite_yoffset + floor(image_yscale * _draw_y),
            image_xscale * _flutter.x_scale, image_yscale,
            c_white,
            1
        );
    }
    draw_set_font(fnt_battle);
    draw_set_halign(fa_center);
    draw_text_colour(x - 8, y - 104, clone_number, c_black, c_black, c_black, c_black, 1);
    draw_set_halign(fa_left);
}
