/// @desc Finish close
array_foreach(bars, instance_destroy);
bars = create_bars(false);
if (!triggered_info && !scr_isOnScreen(id))
{
    with instance_create_layer(160, 192, layer, obj_textbox)
    {
        set_text([". . .", "(You heard the same machinery #again.&(Sounds like it closed.)"]);
    }
}
triggered_info = true;
