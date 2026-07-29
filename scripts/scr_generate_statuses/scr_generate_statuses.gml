function scr_generate_statuses()
{
    // main story progression
    global.soos = 0;
    global.stans = 0;
    global.wendy = 0;
    global.gideon = 0;
    global.gideon_tent = 0;

    // puzzles & side stuff
    global.oneTimeInstances = []; // Array of instance IDs for objects with a one-time effect
    global.completedPuzzleRooms = []; // Array of room names for completed puzzles

    // miscellaneous
    global.ghost = 0; // the highest category of ghost we have defeated
    global.has_fedora = false; // as acquired from Plaidypus - TODO: This is unused
    global.dummy = 0; // the outcome of the wax stans fight
    global.studied_hawktopus = false; // whether we have studied the hawktopus
    global.karen = false; // whether Karen can be encountered
    global.defeated_unicorn = false; // TODO: This is unused
    global.tent_battles = TENT_BATTLE.ALL;

    // Used by obj_toRoom
    global.toRoom = false;
    global.teleport = false;
    global.toRoom_num = 0;
    global.dir = DIRECTION.DOWN;
}
