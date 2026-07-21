if (stage >= 6 && stage <= 10 && alarm[2] > -1)
{
    draw_set_font(fnt_basic_gui);
    if (alarm[2] < beat_time + beat_time)
    {
        draw_set_alpha(alarm[2] / (beat_time + beat_time));
    }
    draw_text(320 + text_offset, 280, string_join_ext("", current_text, 0, text_length));
    draw_set_alpha(1);
}
