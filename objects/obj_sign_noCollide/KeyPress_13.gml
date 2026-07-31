if (is_interaction())
{
    with instance_create_layer(160, (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192, layer, obj_textbox)
    {
        set_text(other.text);
        set_fonts(other.font);
        set_sounds(other.sound);
        set_charRates(other.charRate);
        set_choiceCounts(other.choice);
    }
}
