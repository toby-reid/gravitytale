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
        24 // TENT
        // TENT battles (not in this order):
        // Sev'ral Timez 3
        // Sev'ral Timez 2 + Wizard
        // Sherlock + Larry + Wizard
        // Lizzie + Groucho
        // Shakespeare + Genghis Kahn
        // Tyrone
        // Dipper clones 3-4 (the two survivors)
        // Dipper clones 5-7
        // Dipper clones 8-10
        // Paper jam Dipper
        // Oops! All Invisible Wizards (3)
        // Total: 26, but 3&4 must survive
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
    ALL = 111_1111_1111
}
