
function scr_generate_area_kills()
{
    enum AREA {
        UNKNOWN,
        SCUTTLEBUTT,
        FOREST,
        CAVES,
        MINES,
        TENT,
        TOTAL
    }
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
