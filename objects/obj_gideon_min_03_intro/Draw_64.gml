/// @description Flashbang

// Reserve the last couple seconds for silence
if (self.alarm[3] > 120)
{
    var _alpha = (self.alarm[3] - 120) / 180;
    draw_set_alpha(_alpha);
    draw_rectangle_colour(0, 0, 639, 479, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
}
