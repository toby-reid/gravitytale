enum ROUTES
{
    NONE,
    NEUTRAL,
    PACIFIST,
    GENOCIDE
}

/// Performs necessary actions to save a route completion in the persistent Reset file.
/// @param {Real} route: One of the 3 routes as found in `ROUTES` enum
function scr_completedRoute(route)
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var prev_completions = floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, route, 0));
    ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.COMPLETED_COUNT, route, prev_completions + 1);
	ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.LAST_ROUTE, global.SAVE_FILES.PERS_RESET.KEYS.LAST_ROUTE, route);
    ini_close();
}

/// Determines the number of times the given route has been completed.
/// If `route` is `NONE` (or not provided), it will sum up all 3 route completions.
/// @param {Real} route: The route to check, or `ROUTES.NONE` to sum all 3 routes
/// @return {Real}: The number of times the given route (or any route) has been completed
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

/// Determines the last route that was completed (from the `ROUTES` enum).
/// @return {Real}: The last completed route, or `ROUTES.NONE` if none is found
function scr_getPreviousRoute()
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var previous_route = floor(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.LAST_ROUTE, global.SAVE_FILES.PERS_RESET.KEYS.LAST_ROUTE, ROUTES.NONE));
    ini_close();
    return previous_route;
}
