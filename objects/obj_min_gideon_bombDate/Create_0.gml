event_inherited();
doll_count = 0; // add 1 per doll created
one_second = game_get_speed(gamespeed_fps);
alarm[2] = one_second;
time_left = 111 * instance_number(obj_min_gideon_bombDate_doll); // seconds
done = false;

if (!variable_global_exists("gideon"))
{
    global.gideon = 0;
}
else if (global.gideon >= 14)
{
    instance_destroy();
}

x = -40;
y = -40;

audio_play_sound(mus_deathreport, 0, true);
