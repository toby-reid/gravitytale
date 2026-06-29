image_alpha = 0;
goto = room;

start_alert = function(_snap_to_dipper = true)
{
    alarm[0] = 30;
    audio_stop_all();
    audio_play_sound(sfx_alert, 0, false);
    image_alpha = 1;
    if (_snap_to_dipper)
    {
        x = obj_dipper.x;
        y = obj_dipper.y - 20;
        obj_dipper.canMove = false;
    }
}
