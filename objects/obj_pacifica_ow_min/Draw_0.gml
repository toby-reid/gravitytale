draw_self();
if (blackout_alpha > 0)
{
    draw_set_alpha(blackout_alpha);
    draw_rectangle_colour(blackout_box[0], blackout_box[1], blackout_box[2], blackout_box[3], c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}
