/// @desc Timer to start biggerizing
++stage;
if (stage == STAGE_COUNT)
{
    instance_destroy();
    exit;
}
if (stage == 1)
{
    audio_play_sound(sfx_bell, 0, false);
}
alarm[0] = stage_speed;
