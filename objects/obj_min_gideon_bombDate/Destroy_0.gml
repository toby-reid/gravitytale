if (global.gideon < 14)
{
    global.gideon = 14;
    obj_dipper.canMove = true;
    instance_destroy(obj_dontGo);
    audio_group_stop_all(Music);
    audio_play_sound(mus_wind, 0, true);
}
with instance_create_layer(0, 0, layer, obj_randBattle)
{
    loc = AREA.MINES;
    prevMusic = mus_medium;
}
