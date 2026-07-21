is_interaction = function() {
    if (instance_exists(obj_textbox) || !instance_exists(obj_dipper) || !obj_dipper.canMove)
    {
        return false;
    }
    var _dip_dir = obj_dipper.dir;
    return (
        (place_meeting(x - 2, y, obj_dipper) && _dip_dir == DIRECTION.RIGHT)
        || (place_meeting(x, y + 2, obj_dipper) && _dip_dir == DIRECTION.UP)
        || (place_meeting(x + 2, y, obj_dipper) && _dip_dir == DIRECTION.LEFT)
        || (place_meeting(x, y - 2, obj_dipper) && _dip_dir == DIRECTION.DOWN)
    );
}
get_ybox = function() {
    return (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
}
