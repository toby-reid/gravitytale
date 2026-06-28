if (instance_exists(stacked_gnome))
{
    var _move_time = 30;
    stacked_gnome.vspeed = (stacked_gnome.y - y) / _move_time;
    stacked_gnome.hspeed = (stacked_gnome.x - x) / _move_time;
    if (stacked_gnome.hspeed != 0)
    {
        stacked_gnome.image_angle = (stacked_gnome.hspeed < 0) ? -15 : 15;
    }
    stacked_gnome.alarm[10] = _move_time;
    
    for (var i = 0, _gnome_count = instance_number(object_index); i < _gnome_count; ++i)
    {
        var _gnome = instance_find(object_index, i);
        if (_gnome == id)
        {
            continue;
        }
        if (_gnome.stacked_gnome == stacked_gnome)
        {
            _gnome.stacked_gnome = noone;
        }
    }
}
event_inherited();
