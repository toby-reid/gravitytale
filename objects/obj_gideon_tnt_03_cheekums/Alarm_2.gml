/// @desc Metronome
if (current_beat == BEATS_PER_MEASURE)
{
    ++current_measure;
    current_beat = 1;
}
else
{
    ++current_beat;
}

if (text_page < array_length(LYRICS) && ((current_beat == 1 && current_measure % 4 == 1) || (current_beat == BEATS_PER_MEASURE && current_measure % 4 == 2)))
{
    ++text_page;
    text_length = 1;
    alarm[4] = BEAT_TIME + BEAT_TIME;
}
else if (text_length < array_length(LYRICS[text_page]))
{
    arm_index = (arm_index + 1) % 2;
    ++text_length;
    alarm[4] = BEAT_TIME + BEAT_TIME;
}

if (current_beat == BEATS_PER_MEASURE && current_measure % 2 == 0)
{
    arm_index = 0;
}

alarm[2] = BEAT_TIME;
