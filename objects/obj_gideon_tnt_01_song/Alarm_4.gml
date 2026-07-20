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
                // fallthrough
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
                audio_sound_loop(mus_love_3, false);
                alarm[2] = 4 * BEATS_PER_MEASURE * beat_time; // give it some good time to settle in
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

var _stanza_index = stage - 7;
if (_stanza_index >= 0)
{
    var _stanza = LYRICS[_stanza_index];
    if (
        ((current_measure == 2 || current_measure == 6) && current_beat == BEATS_PER_MEASURE))
        || ((current_measure == 1 || current_measure == 5) && current_beat == 1)
    {
        current_text = _stanza[0];
        text_length = 1;
        arm_index = (current_beat == 1) ? 1 : 0;
    }
    else if (text_length < array_length(current_text))
    {
        ++text_length;
        arm_index = (arm_index + 1) % 2;
    }
    else if (current_beat == BEATS_PER_MEASURE - 1 && current_measure != 1 && current_measure != 5)
    {
        arm_index = 0;
    }
}

alarm[4] = beat_time;
