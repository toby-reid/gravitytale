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
}
