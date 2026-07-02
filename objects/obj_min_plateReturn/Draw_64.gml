if (flash_alpha > 0)
{
    draw_set_alpha(flash_alpha);
    draw_rectangle_colour(0, 0, 639, 479, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
    flash_alpha -= 0.04;
}
