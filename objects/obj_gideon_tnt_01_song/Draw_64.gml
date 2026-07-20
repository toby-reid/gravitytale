if (stage >= 7 && stage < 10)
{
    draw_set_font(fnt_basic_gui);
    draw_text(320 + text_offset, 40, string_join_ext("", current_text, 0, text_length));
}
