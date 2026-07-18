has_done_cutscene = array_contains(global.oneTimeInstances, id);
if (!has_done_cutscene)
{
    obj_save.image_alpha = 0;
    original_camera_y = 0;
    camera_move_speed = 2;
}
