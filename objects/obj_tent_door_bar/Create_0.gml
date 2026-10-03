if (is_open)
{
    image_yscale = is_flipped ? -1 : 1;
}
else
{
    image_yscale = is_flipped ? -full_size : full_size;
}

if (is_horizontal)
{
    image_angle = 270;
}

door_speed = 0;
open = function(_open_speed = 1)
{
    door_speed = abs(_open_speed);
}
close = function(_close_time = 5)
{
    door_speed = -((full_size - 1) / _close_time);
    alarm[0] = _close_time;
}

m_finish_open = function()
{
    image_yscale = is_flipped ? -1 : 1;
    door_speed = 0;
    if (door_hook != noone)
    {
        door_hook.on_bar_open(id);
    }
}
m_finish_close = function()
{
    image_yscale = is_flipped ? -full_size : full_size;
    door_speed = 0;
    if (door_hook != noone)
    {
        door_hook.on_bar_close(id);
    }
}
