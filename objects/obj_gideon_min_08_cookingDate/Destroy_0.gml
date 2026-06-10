if (global.gideon < 8) global.gideon = 8;
instance_destroy(obj_dontGo);
if (!audio_is_playing(mus_medium))
{
    audio_group_stop_all(Music);
    audio_play_sound(mus_medium, 0, true);
}
with instance_create_layer(0, 0, layer, obj_randBattle)
{
    loc = AREA.MINES;
    prevMusic = mus_medium;
}
