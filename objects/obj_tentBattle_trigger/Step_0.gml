if (alpha_delta != 0)
{
    obj_tentBattle_shadow.image_alpha += alpha_delta;
    if (obj_tentBattle_shadow.image_alpha >= 1)
    {
        obj_tentBattle_shadow.image_alpha = 1;
        alert();
        alpha_delta = 0;
    }
}
if (audio_is_playing(sfx_toBattle))
{
    instance_destroy();
}
