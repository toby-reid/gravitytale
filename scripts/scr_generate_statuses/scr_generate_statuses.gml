function scr_generate_statuses()
{
    global.soos = 0;
    global.stans = 0;
    global.wendy = 0;
    global.gideon = 0;
    global.gideon_tent = 0;

    global.oneTimeInstances = []; // Array of instance IDs for objects with a one-time effect
    global.completedPuzzleRooms = []; // Array of room names for completed puzzles

    global.ghost = 0;
    global.hat = false;
    global.dummy = 0;
    global.study = false; // hawktopus study
    global.karen = false; // whether Karen can be encountered
    global.defeated_unicorn = false;

    global.teleport = false;
    global.toRoom_num = 0;
}
// TODO: Investigate battleTimer
