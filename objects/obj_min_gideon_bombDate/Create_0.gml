event_inherited();
doll_count = 0; // add 1 per doll created
one_second = game_get_speed(gamespeed_fps);
alarm[2] = one_second;
time_left = 300; // seconds
done = false;

audio_play_sound(mus_deathreport, 0, true);
