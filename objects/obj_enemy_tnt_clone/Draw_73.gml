if (instance_find(object_index, 0) == id)
{
    var _papercut_count = array_length(papercuts)
    if (_papercut_count > 0)
    {
        for (var i = 0; i < _papercut_count; ++i)
        {
            // TODO: Shaders may be impractical...
            var _papercut = papercuts[i];
            draw_line_width_colour(obj_soul.x + _papercut[0], obj_soul.y + _papercut[1], obj_soul.x + _papercut[2], obj_soul.y + _papercut[3], 2, c_maroon, c_maroon);
        }
    }
}
