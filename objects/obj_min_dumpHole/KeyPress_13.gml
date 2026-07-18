if (!instance_exists(obj_textbox) && instance_exists(obj_dipper) && obj_dipper.canMove)
{
    var _dip_dir = obj_dipper.dir;
    var _ybox = (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
    if (
        (place_meeting(x - 2, y, obj_dipper) && _dip_dir == DIRECTION.RIGHT)
        || (place_meeting(x, y + 2, obj_dipper) && _dip_dir == DIRECTION.UP)
        || (place_meeting(x + 2, y, obj_dipper) && _dip_dir == DIRECTION.LEFT)
        || (place_meeting(x, y - 2, obj_dipper) && _dip_dir == DIRECTION.DOWN)
    )
    {
        var _is_from_side = (_dip_dir == DIRECTION.RIGHT || _dip_dir == DIRECTION.LEFT);
        with instance_create_layer(160, _ybox, layer, obj_textbox)
        {
            set_text([
                "(It's a hole.)",
                "(From certain experiences, #you know this leads down #to the Mines.)",
                "(You see some rope dangling #down in case you need #to return.)",
                _is_from_side ? "(Jump?)" : "(However, this is an awkward #angle to jump from.)"
            ]);
            if (_is_from_side)
            {
                set_choices(
                    3,
                    ["Across", "Down", "(Cancel)"],
                    [
                        method({target: other.id}, function() { target.prepare_jump(false); }),
                        method({target: other.id}, function() { target.prepare_jump(true); }),
                        noop
                    ],
                    method({target: id}, function() { target.next_page(); })
                );
            }
        }
    }
}
