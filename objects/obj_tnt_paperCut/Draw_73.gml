var _x1 = x1;
var _y1 = y1;
if (size_proportion != 1)
{
    _x1 = x0 + (size_proportion * (x1 - x0));
    _y1 = y0 + (size_proportion * (y1 - y0));
}
draw_line_width_colour(x0, y0, _x1, _y1, 2, c_red, c_red);

if (alarm[1] > -1)
{
    draw_rectangle_colour(0, 0, room_width - 1, room_height - 1, c_maroon, c_maroon, c_maroon, c_maroon, false);
}
