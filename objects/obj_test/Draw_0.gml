var _drawx = x;
var _drawy = y;
var _angle_delta = 360 div 10;
var _angle = -2 * _angle_delta;
for (var i = 0; i < 5; ++i)
{
    var _drawx_to = _drawx + lengthdir_x(side_length, _angle);
    var _drawy_to = _drawy + lengthdir_y(side_length, _angle);
    draw_line(_drawx, _drawy, _drawx_to, _drawy_to);
    _drawx = _drawx_to;
    _drawy = _drawy_to;
    _angle = (((_angle + 180) mod 360) + _angle_delta) mod 360;
}
