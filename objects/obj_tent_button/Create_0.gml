image_speed = 0;
is_pressed = false;

subscribers = [];
add_subscriber = function(_sub_id)
{
    array_push(subscribers, _sub_id);
}
remove_subscriber = function(_sub_id)
{
    while (array_contains(subscribers, _sub_id))
    {
        var _sub_index = array_get_index(subscribers, _sub_id);
        array_delete(subscribers, _sub_index, 1);
    }
}
m_on_pressed_toggle = function(_is_pressed = is_pressed)
{
    array_foreach(subscribers, function(_sub) { _sub.on_press(id, _is_pressed); });
}
