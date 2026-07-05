
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
        20 // TENT: change as needed
    ];
}
