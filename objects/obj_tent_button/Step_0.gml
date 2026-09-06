if (is_pressed && pop_up && !instance_place(x, y, obj_dipper) && !instance_place(x, y, obj_dipperClone))
{
    is_pressed = false;
    image_index = 0;
    audio_play_sound(sfx_click, 0, false);
    m_on_pressed_toggle(is_pressed);
}
