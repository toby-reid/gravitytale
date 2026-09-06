if (!is_pressed)
{
    is_pressed = true;
    image_index = 1;
    audio_play_sound(sfx_click, 0, false);
    m_on_pressed_toggle(is_pressed);
}
