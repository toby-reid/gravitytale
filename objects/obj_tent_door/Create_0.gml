if (array_contains(global.oneTimeInstances, id))
{
    instance_destroy();
    exit;
}

is_horizontal = (image_index == 1);
triggered_info = false;

BAR_WIDTH = 5; // px

create_bars = function(_is_open = false, _bar_count = 0)
{
    if (_bar_count == 0)
    {
        _bar_count = (is_horizontal ? sprite_height : sprite_width) div BAR_WIDTH;
    }
    var _bar_length = is_horizontal ? sprite_width : sprite_height;
    var _bar_half = _bar_length div 2;
    var _bar_split_variation = _bar_length div 4;

    var _bars = array_create(_bar_count + _bar_count, noone);
    for (var i = 0; i < _bar_count; ++i)
    {
        var _bar_index = i + i;
        var _bar_offset = i * BAR_WIDTH;
        var _bar_split = _bar_half + irandom_range(-_bar_split_variation, _bar_split_variation);
        _bars[_bar_index] = instance_create_layer(
            x + (is_horizontal ? 0 : _bar_offset),
            y + (is_horizontal ? _bar_offset : 0),
            layer,
            obj_tent_door_bar,
            {
                is_flipped: false,
                is_horizontal: is_horizontal,
                is_open: _is_open,
                door_hook: id,
                full_size: _bar_split
            }
        );
        _bars[_bar_index + 1] = instance_create_layer(
            x + (is_horizontal ? _bar_length : _bar_offset),
            y + (is_horizontal ? _bar_offset : _bar_length),
            layer,
            obj_tent_door_bar,
            {
                is_flipped: true,
                is_horizontal: is_horizontal,
                is_open: _is_open,
                door_hook: id,
                full_size: _bar_length - _bar_split
            }
        );
    }
    return _bars;
}
bars = create_bars();

create_collider = function()
{
    return instance_create_layer(x, y, layer, obj_tent_door_ouster, {image_xscale: image_xscale, image_yscale: image_yscale, oust_direction: oust_direction});
}
collider = create_collider();

on_press = function(_is_button_pressed)
{
    if (_is_button_pressed)
    {
        if (array_all(required_buttons, function(_button) { return button.is_pressed; }))
        {
            open();
        }
    }
    else
    {
        close();
    }
}

open = function(_open_speed = 1)
{
    array_foreach(bars, function(_bar) { _bar.open(_open_speed); });
    audio_play_sound(sfx_hiss, 0, false);
}
close = function(_time = 5)
{
    array_foreach(bars, function(_bar) { _bar.close(_time); });
    collider = create_collider();
    alarm[0] = _time;
    audio_play_sound(sfx_hiss, 0, false);
}

on_bar_open = function(_bar_id)
{
    var _bar_index = array_get_index(bars, _bar_id);
    instance_destroy(bars[_bar_index]);
    array_delete(bars, _bar_index, 1);
    if (array_length(bars) == 0)
    {
        instance_destroy(collider);
        collider = noone;
        if (!triggered_info && !scr_isOnScreen(id))
        {
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([". . .", "(You heard some light machinery #in the distance.)"]);
            }
        }
        if (is_solve_permanent)
        {
            array_push(global.oneTimeInstances, id);
            instance_destroy();
        }
        else
        {
            bars = create_bars(true);
        }
    }
}
on_bar_close = function(_bar_id)
{
    // All should finish at the same time;
    // actual close should be handled by alarm.
    return;
}
