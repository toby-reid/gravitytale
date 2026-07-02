if (other.canMove)
{
    other.canMove = false;
    audio_play_sound(sfx_fall, 0, false);
    audio_sound_gain(mus_medium, 0, 1);
    self.alarm[0] = 120;
}
