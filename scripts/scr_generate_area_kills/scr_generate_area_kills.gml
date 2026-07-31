enum AREA {
    UNKNOWN,
    SCUTTLEBUTT,
    FOREST,
    CAVES,
    MINES,
    TENT,
    TOTAL
}

function scr_generate_area_kills()
{
    global.areaKills = array_create(AREA.TOTAL, 0);
    global.MAX_KILLS = [
        0, // UNKNOWN
        18, // SCUTTLEBUTT
        25, // FOREST
        30, // CAVES
        36, // MINES
        42 // TENT
        // TENT battles (not in this order):
        // Sev'ral Timez 3
        // Sev'ral Timez 2 + Wizard
        // Sherlock + Larry + Wizard
        // Lizzie + Groucho + Bird
        // Shakespeare + Genghis Kahn
        // Dipper clones 2-4
        // Dipper clones 5-7
        // Dipper clones 8-10
        // Paper jam Dipper
        // Parrot-ox + 2, 3 times
        // Aposto-Finch + 2, 2 times
        // Oops! All Invisible Wizards (3)
        // Total: 42
    ];
}

enum TENT_BATTLE {
    SEVRAL_TIMEZ_3 = 1 << 0,
    SEVRAL_TIMEZ_2 = 1 << 1,
    SHERLOCK_LARRY = 1 << 2,
    LIZZIE_GROUCHO = 1 << 3,
    SHAKESPEARE_GENGHIS = 1 << 4,
    TYRONE = 1 << 5,
    CLONE_3_4 = 1 << 6, // the two survivors
    CLONE_5_6_7 = 1 << 7,
    CLONE_8_9_10 = 1 << 8,
    PAPER_JAM = 1 << 9,
    ALL_WIZARDS = 1 << 10,
    ALL = 11_1111_1111
}

function get_tent_battle()
{
    if (global.tent_battles == 0)
    {
        return 0;
    }
    if (global.tent_battles == TENT_BATTLE.ALL)
    {
        return TENT_BATTLE.TYRONE; // he shall be the first
    }
    var _available_battles = [];
    for (var i = 1; i <= global.tent_battles; i = i << 1)
    {
        if (scr_has_enum_flag(global.tent_battles, i))
        {
            array_push(_available_battles, i);
        }
    }
    var _battle_index = irandom(array_length(_available_battles) - 1);
    return _available_battles[_battle_index];
}
