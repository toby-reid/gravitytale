draw_sprite(sprite_index, segments.top, x, y - sprite_size);
var _drawy = y;
for (var i = 0; i < image_yscale; ++i)
{
    draw_sprite(sprite_index, segments.middle, x, _drawy);
    _drawy += sprite_size;
}
draw_sprite(sprite_index, segments.bottom, x, _drawy);
