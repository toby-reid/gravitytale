/// @desc Determines if the given object is visible on screen
/// @param {Id.Instance} _id The object to check for on-screen visibility
/// @param {Bool} _check_origin_only Whether to check only the object's coordinates or (if `false`) its entire bounding box
/// @return {Bool} Whether the given object is on the visible screen
function scr_isOnScreen(_id, _check_origin_only = true)
{
    var _camera = view_camera[0];
    var _camera_x0 = camera_get_view_x(_camera);
    var _camera_y0 = camera_get_view_y(_camera);
    var _camera_x1 = _camera_x0 + camera_get_view_width(_camera);
    var _camera_y1 = _camera_y0 + camera_get_view_height(_camera);
    if (_check_origin_only)
    {
        return point_in_rectangle(_id.x, _id.y, _camera_x0, _camera_y0, _camera_x1, _camera_y1);
    }
    return rectangle_in_rectangle(_id.bbox_left, _id.bbox_top, _id.bbox_right, _id.bbox_bottom, _camera_x0, _camera_y0, _camera_x1, _camera_y1) > 0;
}
