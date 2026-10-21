draw_rectangle_colour(battlebox_left, y + 4, battlebox_right, battlebox_bottom, c_ltgrey, c_ltgrey, c_dkgrey, c_dkgrey, false);
if (dummy_exists)
{
    draw_sprite_ext(sprite_index, image_index, dummy_x, dummy_y, image_xscale, yscale_mult * image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_self();
}
