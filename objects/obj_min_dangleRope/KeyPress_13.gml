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
        with instance_create_layer(160, _ybox, layer, obj_textbox)
        {
            set_text([
                // TODO: Continue from here
            ]);
            set_choices(
                // TODO: Continue from here
            );
        }
    }
}

