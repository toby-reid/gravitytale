if (other.canMove)
{
    with instance_create_layer(160, other.y > 140 ? 48 : 192, layer, obj_textbox)
    {
        set_text(other.text);
        set_heads(other.head);
    }
    other.dir = set_dir;
    var _direction = set_dir * 90;
    var _add_x = lengthdir_x(1, _direction);
    var _add_y = lengthdir_y(1, _direction);
    while place_meeting(x, y, other)
    {
        // do it repeatedly to account for running
        other.x += _add_x;
        other.y += _add_y;
    }
}
