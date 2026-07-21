/// @desc Metronome
if (current_beat == BEATS_PER_MEASURE)
{
    if (current_measure == MEASURES_PER_STANZA)
    {
        ++stage;
        switch stage
        {
            case 6:
                audio_stop_sound(mus_love_0);
                audio_play_sound(mus_love_1, 1, true);
                arm = spr_gideon_tv_arm_talk;
                break;
            case 7:
                audio_stop_sound(mus_love_1);
                audio_play_sound(mus_love_1, 1, true);
                break;
            case 8:
                audio_stop_sound(mus_love_1);
                audio_play_sound(mus_love_2, 1, true);
                break;
            case 9:
                audio_stop_sound(mus_love_2);
                audio_play_sound(mus_love_3, 1, true);
                break;
            case 10:
                alarm[6] = beat_time + beat_time;
                alarm[4] = -1;
                exit;
        }
        current_measure = 1;
    }
    else
    {
        ++current_measure;
    }
    current_beat = 1;
}
else
{
    ++current_beat;
}

if (stage >= 6)
{
    m_progress_text();
}
else if (current_measure == MEASURES_PER_STANZA && current_beat == 1)
{
    has_spotlight = true;
}

alarm[4] = beat_time;
