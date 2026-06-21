/// @desc Timer for the big boom!
--time_left;
if (time_left == 0)
{
    audio_group_stop_all(Music);
    audio_play_sound(sfx_horn, 0, false);
    alarm[3] = ceil(audio_sound_length(sfx_horn) * one_second);
    obj_dipper.canMove = false;
    done = true;
}
else
{
    alarm[2] = one_second;
    if (time_left > 200)
    {
        if (time_left % 10 == 0)
        {
            audio_play_sound(sfx_beep, 0, false);
        }
    }
    else if (time_left > 100)
    {
        if (time_left % 5 == 0)
        {
            audio_play_sound(sfx_beep, 0, false);
        }
    }
    else
    {
        audio_play_sound(sfx_beep, 0, false);
    }
}
