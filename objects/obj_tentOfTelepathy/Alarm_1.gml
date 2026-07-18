// Move the camera back down
var _cam = view_camera[0];
camera_set_view_pos(_cam, camera_get_view_x(_cam), camera_get_view_y(_cam) + 1);
if (camera_get_view_y(_cam) >= original_camera_y)
{
    camera_set_view_target(_cam, obj_dipper);
    array_push(global.oneTimeInstances, id);
    has_done_cutscene = true;
    obj_dipper.canMove = true;
}
else
{
    alarm[1] = camera_move_speed;
}
