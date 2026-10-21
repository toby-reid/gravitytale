if (xscale_mult == 1)
{
    draw_self();
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, xscale_mult * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
