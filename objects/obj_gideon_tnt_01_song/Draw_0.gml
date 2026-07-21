if (darkout_alpha > 0 && has_spotlight)
{
    draw_set_alpha(darkout_alpha);
    var _camera = view_camera[0];
    var _camera_x = camera_get_view_x(_camera);
    var _camera_y = camera_get_view_y(_camera);
    draw_rectangle_colour(_camera_x, _camera_y, _camera_x + camera_get_view_width(_camera) - 1, _camera_y + camera_get_view_height(_camera) - 1, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}
event_inherited();
