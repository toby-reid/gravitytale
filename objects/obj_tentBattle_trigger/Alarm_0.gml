if (instance_exists(obj_tentBattle_shadow))
{
    audio_play_sound(sfx_wendyne_axe_appear, 0, false);
    alpha_delta = 0.01;
}
else
{
    alert();
}
