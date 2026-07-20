if (!has_done_cutscene && obj_dipper.y <= 500 && obj_dipper.canMove)
{
    obj_dipper.canMove = false;
    alarm[0] = 120;
    var _cam = view_camera[0];
    camera_set_view_target(_cam, noone);
    original_camera_y = camera_get_view_y(_cam);
}
