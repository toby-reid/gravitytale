/// @description Nigerundayo

switch self.arm_index
{
    case 0:
        self.arm_index = 2;
        if (self.x <= room_width) audio_play_sound(sfx_sans_pound, 0, false);
        self.alarm[4] = 30;
        break;
    case 1:
        self.arm_index = 0;
        audio_play_sound(sfx_grass, 0, false);
        self.hspeed = 2;
        break;
    case 2:
        self.arm_index = 1;
        audio_play_sound(sfx_grass, 0, false);
        self.alarm[4] = 5;
        break;
}
