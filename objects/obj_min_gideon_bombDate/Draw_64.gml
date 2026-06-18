var _hud_width = sprite_get_width(spr_min_news_hud);
draw_sprite_ext(spr_min_news_hud, 0, 0, 0, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_min_news_hud, 1, _hud_width, 0, 2, 2, 0, c_white, 1);

var _doll_color = (doll_count > 0) ? c_red : c_aqua;

var _time_left = (alarm[2] == -1) ? 0 : ceil(alarm[2] / gamespeed_fps);
var _time_color;
if (_time_left > 200)
{
    _time_color = c_yellow;
}
else if (_time_left > 100)
{
    _time_color = c_orange;
}
else if (_time_left > 0)
{
    _time_color = c_red;
}
else
{
    _time_color = c_purple;
}

var _number_offset = [56, 4];
var _number_spacing = 11;
var _number_count = 3;
var _doll_numbering = scr_format_int(doll_count, _number_count);
var _time_numbering = scr_format_int(_time_left, _number_count);
for (var i = 1; i <= _number_count; ++i)
{
    var _x_offset = _number_offset[0] + (_number_spacing * i);
    draw_sprite_ext(spr_min_news_numbers, real(string_char_at(_doll_numbering, i)), _x_offset, _number_offset[1], 2, 2, 0, _doll_color, 1);
    draw_sprite_ext(spr_min_news_numbers, real(string_char_at(_time_numbering, i)), _hud_width + _x_offset, _number_offset[1], 2, 2, 0, _time_color, 1);
}
