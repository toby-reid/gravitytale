if (darkout_alpha > 0)
{
    if (!has_spotlight)
    {
        draw_set_alpha(darkout_alpha);
        var _camera = view_camera[0];
        var _camera_x = camera_get_view_x(_camera);
        var _camera_y = camera_get_view_y(_camera);
        draw_rectangle_colour(_camera_x, _camera_y, _camera_x + camera_get_view_width(_camera) - 1, _camera_y + camera_get_view_height(_camera) - 1, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
    else
    {
        draw_set_alpha(0.25);
        draw_sprite(spr_cav_spotlight, 0, obj_dipper.x, obj_dipper.y - 100);
        draw_sprite(spr_cav_spotlight, 0, x + 10, obj_dipper.y - 100);
        draw_set_alpha(1);
    }
}
else if (stage >= 12 && stage != 13)
{
    var _spotlight_x = (stage == 12) ? obj_dipper.x : (x + 10);
    draw_sprite_ext(spr_cav_spotlight, 0, _spotlight_x, obj_dipper.y - 100, 1, 1, 0, c_fuchsia, 0.5);
}
