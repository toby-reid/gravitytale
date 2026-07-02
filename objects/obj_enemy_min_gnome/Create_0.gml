// Inherit the parent event
event_inherited();
area = AREA.UNKNOWN;
run = false;
image_alpha = 0;
image_index = 2 * irandom((image_number div 2) - 1);
stacked_gnome = noone;
revealed = false;
initial_round = false;

move_dependents = function(_move_time = 30)
{
    if (stacked_gnome != noone)
    {
        stacked_gnome.vspeed = (y - stacked_gnome.y) / _move_time;
        stacked_gnome.hspeed = (x - stacked_gnome.x) / _move_time;
        if (stacked_gnome.hspeed != 0)
        {
            stacked_gnome.image_angle = (stacked_gnome.hspeed < 0) ? 15 : -15;
        }
        stacked_gnome.alarm[10] = _move_time;
        stacked_gnome.move_dependents(_move_time);
    }
}

remove_from_chain = function()
{
    for (var i = 0, _gnome_count = instance_number(object_index); i < _gnome_count; ++i)
    {
        var _gnome = instance_find(object_index, i);
        if (_gnome == id)
        {
            continue;
        }
        if (_gnome.stacked_gnome == id)
        {
            _gnome.stacked_gnome = stacked_gnome;
        }
    }
}
