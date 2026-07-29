/// Deletes files and/or information sections.
/// Specifically, the Profile and binary Save files are deleted, with the Reset file being deleted only with True Reset.
/// @param {Bool} true_reset: Whether to delete the persistent Reset file (if `false`, only certain fields are removed)
function scr_reset(true_reset = false)
{
    file_delete(global.SAVE_FILES.PROFILE.NAME);
    file_delete(global.SAVE_FILES.SAVE_DATA.NAME);
    if (true_reset)
    {
        file_delete(global.SAVE_FILES.PERS_RESET.NAME);
    }
    else
    {
        ini_open(global.SAVE_FILES.PERS_RESET.NAME);
        ini_section_delete(global.SAVE_FILES.PERS_RESET.KEYS.KILLED_COUNT);
        ini_section_delete(global.SAVE_FILES.PERS_RESET.KEYS.SPARED_COUNT);
        ini_section_delete(global.SAVE_FILES.PERS_RESET.KEYS.DIED_TO_COUNT);
        ini_close();
    }
    // TODO: Add startup functions
}
