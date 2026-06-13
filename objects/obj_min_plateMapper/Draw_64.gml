if (active && map != noone)
{
    draw_set_alpha(0.5);
    draw_rectangle_colour(
        0, 0, display_get_gui_width(), display_get_gui_height(),
        c_black, c_black, c_black, c_black, false
    );
    draw_set_alpha(1);
    draw_sprite_ext(
        map, 0,
        floor(display_get_gui_width() / 2), floor(display_get_gui_height() / 2), 2, 2, 0, c_white, 1
    );
}
