enum ROUTES
{
    NONE,
    NEUTRAL,
    PACIFIST,
    GENOCIDE
}

function scr_completedRoute(route)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var prev_completions = floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, route, 0));
    ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, route, prev_completions + 1);
    ini_close();
}

function scr_getRouteCompletions(route = ROUTES.NONE)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var prev_completions =
        (route == ROUTES.NONE)
        ? (
            floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, ROUTES.NEUTRAL, 0))
            + floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, ROUTES.PACIFIST, 0))
            + floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, ROUTES.GENOCIDE, 0))
        ) : floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, route, 0));
    ini_close();
    return prev_completions;
}

function scr_getPreviousRoute()
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var previous_route = floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.LAST_ROUTE, global.SAVE_FILES.PERS_RESET.KEYS.LAST_ROUTE, ROUTES.NONE));
    ini_close();
    return previous_route;
}
