if (global.gideon_tent >= 1)
{
    instance_destroy();
    exit;
}
event_inherited();
stage = 0;
arm = spr_gideon_tv_arm_move;
arm_index = 2;
alArm_speed = 3; // maybe 2 if we need shorter time?
face = -1;

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
            ["BUT ", "DON'T ", "YOU ", "BE ", "A", "LARMED"]
        ],[
            ["YOU ", "WON'T ", "LEAVE"],
            ["OR ", "I ", "MIGHT ", "DIE"],
            ["CRY ", "CRY ", "CRY "],
            ["SO ", "YOU ", "SHALL ", "BE ", "MY ", "QUEEN"]
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
            ["THAT ", "BREAKS ", "MY ", "HEART"]
        ],[
            ["I'LL ", "PUT ", "HIM"],
            ["A", "WAY ", "TO ", "ROT"],
            ["DO ", "NOT ", "FEAR"],
            ["THOUGH ", "HE ", "MAY ", "DIE ", "A ", "LOT"]
        ],[
            ["REAL", "LY ", "SAD"],
            ["HE'S ", "GON", "NA ", "DIE"],
            ["CRY ", "CRY ", "CRY "],
            ["BUT ", "THEN ", "YOU'LL ", "BE ", "MY ", "QUEEN"]
        ]
    ];

current_text = [];
text_length = 0;
text_offset = 0;
MAX_TEXT_OFFSET = 10;
text_offset_dir = 1;
