if (!done)
{
    x = camera_get_view_x(view_current) + 280;
    y = camera_get_view_y(view_current) + 40;
}
event_inherited();
draw_sprite_ext(spr_nettrap, sprite_get_number(spr_nettrap) - 1, x + 9, y + 16, 2, 2, 0, c_white, 0.75);
