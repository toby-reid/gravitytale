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
        44 // TENT
        // TENT battles (not in this order):
        // 3: Sev'ral Timez 3
        // 3: Sev'ral Timez 2 + Wizard
        // 3: Sherlock + Larry + Wizard
        // 2: Lizzie + Groucho
        // 2: Shakespeare + Genghis Kahn
        // 1: Tyrone
        // 2: Dipper clones 3-4 (the two survivors)
        // 3: Dipper clones 5-7
        // 3: Dipper clones 8-10
        // 1: Paper jam Dipper
        // 3: Oops! All Invisible Wizards (3)
        // Total: 26, but 3&4 must survive, so 24
        // Plus, an army of Gnomes for Gnomezilla... maybe like 20?
    ];
}

enum TENT_BATTLE {
    NONE = 0,
    SEVRAL_TIMEZ_3 = 1 << 0,
    SEVRAL_TIMEZ_2 = 1 << 1,
    SHERLOCK_LARRY = 1 << 2,
    LIZZIE_SHAKESPEARE = 1 << 3,
    GROUCHO_GENGHIS = 1 << 4,
    TYRONE = 1 << 5,
    CLONE_3_4 = 1 << 6, // the two survivors
    CLONE_5_6_7 = 1 << 7,
    CLONE_8_9_10 = 1 << 8,
    PAPER_JAM = 1 << 9,
    ALL_WIZARDS = 1 << 10,
    ALL = 0b0111_1111_1111
}

function get_random_tent_battle()
{
    var _options = [];
    for (var i = 1; i < TENT_BATTLE.ALL; i = i << 1)
    {
        if (scr_has_enum_flag(global.tent_battles, i) && (i < TENT_BATTLE.TYRONE || i > TENT_BATTLE.PAPER_JAM))
        {
            array_push(_options, i);
        }
    }
    var _option_count = array_length(_options);
    return (_option_count == 0) ? TENT_BATTLE.NONE : _options[irandom(_option_count - 1)];
}
