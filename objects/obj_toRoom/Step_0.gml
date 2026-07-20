if (fade != 0)
{
    alpha += fade;
    if (fade < 0 && alpha <= 0)
    {
        fade = 0;
        alpha = 0;
        if (global.toRoom)
        {
            // Assume someone else will take care of canMove
            obj_dipper.canMove = true;
            global.toRoom = false;
        }
        if (goto == -1)
        {
            instance_destroy();
        }
    }
    else if (fade > 0)
    {
        if (alpha >= 1)
        {
            room_persistent = false;
            global.toRoom = true;
            global.dir = dir;
            global.toRoom_num = num;
            if (music != -1 && music != noone && !audio_is_playing(music))
            {
                audio_group_stop_all(Music);
                audio_group_set_gain(Music, 1); // immediately start playing; many tracks have their own fade
                if (music != silence)
                {
                    audio_play_sound(music, 0, true);
                }
            }
            room_goto(goto);
        }
    }
}
