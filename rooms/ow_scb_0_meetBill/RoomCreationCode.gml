audio_stop_all();
//window_set_caption("GravityTale - The Dreamscape")
global.player.hp = global.player.maxHp;
ini_open(global.SAVE_FILES.PERS_RESET.NAME);
ini_write_real(global.SAVE_FILES.PERS_RESET.KEYS.IS_MABEL, global.SAVE_FILES.PERS_RESET.KEYS.IS_MABEL, global.player.mabel);
ini_close();
