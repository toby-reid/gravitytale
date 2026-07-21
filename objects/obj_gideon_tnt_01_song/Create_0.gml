if (global.gideon_tent >= 1)
{
    instance_destroy();
    exit;
}
event_inherited();
stage = 0;
darkout_alpha = 0;
has_spotlight = false;
arm = spr_gideon_tv_arm_move;
arm_index = 2;
alArm_speed = 3; // maybe 2 if we need shorter time?

beat_time = game_get_speed(gamespeed_fps) div 2; // Oh! One True Love is at 120 BPM, or 2 per second
current_beat = 1;
BEATS_PER_MEASURE = 4;
current_measure = 1;
MEASURES_PER_STANZA = 8;

LYRICS = global.player.mabel
    ? [
        [
            ["OH ", "MY ", "LOVE"],
            ["DON'T ", "RUN ", "A", "WAY"],
            ["I'D ", "PRE", "FER"],
            ["IF ", "YOU'D ", "JUST ", "STAY"]
        ],[
            ["NO ", "ONE ", "COULD"],
            ["KEEP ", "US ", "A", "PART"],
            ["THEY ", "ALL ", "KNOW"],
            ["THAT'D ", "BREAK ", "MY ", "HEART"]
        ],[
            ["I ", "WOULD ", "CALL"],
            ["THE ", "TOWN ", "TO ", "ARMS"],
            ["IT ", "WOULD ", "SUCK"],
            ["BUT ", "DON'T ", "YOU\n", "BE ", "A", "LARMED"]
        ],[
            ["YOU ", "WON'T ", "LEAVE"],
            ["OR ", "I ", "MIGHT ", "DIE"],
            ["CRY ", "CRY ", "CRY "],
            ["SO ", "YOU ", "SHALL\n", "BE ", "MY ", "QUEEN"]
        ]
    ] : [
        [
            ["OH ", "MY ", "LOVE"],
            ["PLEASE ", "RUN ", "A", "WAY"],
            ["FAR ", "FROM ", "HIM"],
            ["HE'S ", "NOT ", "O", "KAY"]
        ],[
            ["HE ", "JUST ", "WANTS"],
            ["TO ", "MAKE ", "US ", "PART"],
            ["E", "VEN ", "THOUGH"],
            ["THAT ", "BREAKS ", "MY\n", "HEART"]
        ],[
            ["I'LL ", "PUT ", "HIM"],
            ["A", "WAY ", "TO ", "ROT"],
            ["DO ", "NOT ", "FEAR"],
            ["THOUGH ", "HE ", "MAY\n", "DIE ", "A ", "LOT"]
        ],[
            ["REAL", "LY ", "SAD"],
            ["HE'S ", "GON", "NA ", "DIE"],
            ["CRY ", "CRY ", "CRY "],
            ["BUT ", "THEN ", "YOU'LL\n", "BE ", "MY ", "QUEEN"]
        ]
    ];

current_text = [];
text_length = 0;
text_offset = 0;
MAX_TEXT_OFFSET = 10;
text_offset_dir = 1;
m_is_next_page = function()
{
    if (current_measure == 2)
    {
        return current_beat == BEATS_PER_MEASURE;
    }
    if (current_measure == 6)
    {
        if (stage == 6 || stage == 7)
        {
            return current_beat == BEATS_PER_MEASURE;
        }
        return current_beat == 3;
    }
    if (current_measure == 1 || current_measure == 5)
    {
        return current_beat == 1;
    }
    return false;
}
m_progress_text = function()
{
    if (m_is_next_page())
    {
        current_text = LYRICS[stage - 6][current_measure div 2];
        text_length = 1;
        arm_index = (current_beat == 1) ? 1: 0;
        alarm[2] = 5 * beat_time;
        return;
    }
    if (text_length < array_length(current_text))
    {
        if ((current_measure != 2 && current_measure != 6) || current_beat != BEATS_PER_MEASURE)
        {
            ++text_length;
            arm_index = (arm_index + 1) % 2;
            alarm[2] = 5 * beat_time; // 4 beats to hold, 2 to fade out
        }
        return;
    }
    if (current_beat == BEATS_PER_MEASURE - 1 && current_measure != 2 && current_measure != 6)
    {
        arm_index = 0;
        return;
    }
}
