/// @description Sets the persistent reset file to note that the Wayman has been defeated.
function scr_defeatedWayman()
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.WAYMAN_BOOL, global.SAVE_FILES.PERS_RESET.KEYS.WAYMAN_BOOL, true);
    ini_close();
}

/// @description Determines whether the Wayman has been defeated already.
/// @return {Bool}: Whether the Wayman has been defeated in this or a previous timeline
function scr_isWaymanDefeated()
{
    ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    var isDefeated = bool(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.WAYMAN_BOOL, global.SAVE_FILES.PERS_RESET.KEYS.WAYMAN_BOOL, false));
    ini_close();
    return isDefeated;
}
