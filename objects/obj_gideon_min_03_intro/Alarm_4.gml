/// @description Nigerundayo

switch self.image_index
{
    case 0:
        self.image_index = 2;
        audio_play_sound(sfx_sans_pound, 0, false);
        self.alarm[4] = 20;
        break;
    case 1:
        self.image_index = 0;
        audio_play_sound(sfx_click, 0, false);
        self.hspeed = 5;
        break;
    case 2:
        self.image_index = 1;
        audio_play_sound(sfx_grass, 0, false);
        self.alarm[4] = 5;
        break;
}
