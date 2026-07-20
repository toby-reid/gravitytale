if (is_initialized)
{
    draw_rectangle_colour(0, 0, 639, 479, c_black, c_black, c_black, c_black, false);
    for (var i = 0; i < CAMERA_HEIGHT; ++i)
    {
        var _y = i + i;
        draw_sprite_part(screen, 0, 0, _y, 640, 2, drawx[i], _y);
    }
    if (alpha != 0)
    {
        draw_set_alpha(alpha);
        draw_rectangle_colour(-320, -240, 960, 720, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
}
