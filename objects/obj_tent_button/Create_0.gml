image_speed = 0;
is_pressed = false;

subscribers = [];
add_subscriber = function(_sub_id)
{
    array_push(subscribers, _sub_id);
}
m_on_pressed_toggle = function(_is_pressed = is_pressed)
{
    for (var i = 0, _sub_count = array_length(subscribers); i < _sub_count; ++i)
    {
        subscribers[i].on_press(id, _is_pressed);
    }
}
