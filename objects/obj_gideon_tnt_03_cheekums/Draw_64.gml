if (alarm[4] > -1)
{
    draw_set_font(fnt_basic_gui);
    if (alarm[4] < BEAT_TIME)
    {
        draw_set_alpha(alarm[4] / BEAT_TIME);
    }
    draw_text(40, 20, string_join_ext("", LYRICS[text_page], 0, text_length));
    draw_set_alpha(1);
}
