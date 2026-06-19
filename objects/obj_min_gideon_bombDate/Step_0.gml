if (!done && doll_count == 0 && time_left > 0)
{
    alarm[2] = -1;
    audio_group_stop_all(Music);
    audio_play_sound(sfx_puzDone, 0, false);
    alarm[3] = audio_sound_length(sfx_puzDone) * gamespeed_fps;
    obj_dipper.canMove = false;
    done = true;
}

if (instance_exists(obj_textbox) && obj_textbox.sound[obj_textbox.page] == tlk_gideon)
{
    arm_index = obj_textbox.face;
}
else
{
    arm_index = 0;
}

if (done && !instance_exists(obj_textbox))
{
    vspeed = -1;
    audio_group_set_gain(Music, audio_group_get_gain(Music) - 0.01);
    if (audio_group_get_gain(Music) <= 0)
    {
        audio_group_set_gain(Music, 1);
        instance_destroy();
    }
}
