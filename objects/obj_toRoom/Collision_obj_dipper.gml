if (obj_dipper.canMove && goto != -1)
{
    obj_dipper.canMove = false;
    fade = 0.1;
    if (music != -1 && music != noone)
    {
        audio_group_set_gain(Music, 0, MUSIC_FADE_SPEED);
    }
    if (door)
    {
        audio_play_sound(sfx_door, 0, false);
    }
}
