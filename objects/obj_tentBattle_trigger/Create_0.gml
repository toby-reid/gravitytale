if (!scr_has_enum_flag(global.tent_battles, battle_index))
{
    instance_destroy();
    exit;
}
alpha_delta = 0;
alert = function() {
    alarm[1] = 30;
    audio_play_sound(sfx_alert, 0, false);
}
