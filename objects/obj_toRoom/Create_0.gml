alpha = (!global.teleport && instance_number(object_index) == 1) ? 1 : 0;
fade = (alpha == 0) ? 0 : -0.1;
alarm[0] = 1; // keep as an alarm to retain any creation-code stuff
//num = 0//Change if multiple in a room with same dir or it sends you to room with mult same dir
//music = noone//Change if changing music here
///@desc goto, dir, (poss)num, (poss)music, (poss)door
MUSIC_FADE_SPEED = 10_000 / game_get_speed(gamespeed_fps); // 10 frames, in milliseconds
