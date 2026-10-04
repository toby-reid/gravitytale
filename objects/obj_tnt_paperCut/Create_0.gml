var _start_on_left_edge = irandom(2) != 0;
x0 = _start_on_left_edge ? 0 : irandom(room_width div 3);
y0 = _start_on_left_edge ? irandom(room_height - 1) : choose(0, room_height - 1);
var _end_on_right_edge = irandom(2) != 0;
x1 = _end_on_right_edge ? (room_width - 1) : irandom_range(room_width - (room_width div 3), room_width - 1);
y1 = _end_on_right_edge ? irandom(room_height - 1) : choose(0, room_height - 1);

size_proportion = 0.0;
grow_rate = 1 / grow_time;

audio_play_sound(sfx_paper, 0, false);

stop_grow = function(_flash_time = 10)
{
    size_proportion = 1;
    grow_rate = 0;
}

deal_damage = function(_flash_time = 10)
{
    global.player.hp -= dmg;
    audio_play_sound(sfx_damageTaken, 0, false);
    alarm[1] = _flash_time;
}
