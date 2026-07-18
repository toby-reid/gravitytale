// Move the camera up
var _cam = view_camera[0];
camera_set_view_pos(_cam, camera_get_view_x(_cam), camera_get_view_y(_cam) - 1);
if (camera_get_view_y(_cam) <= 0)
{
    alarm[1] = 300;
}
else
{
    alarm[0] = camera_move_speed;
}
