if !audio_is_playing(mus_menu) {
	audio_stop_all();
	audio_play_sound(mus_menu,0,true);
}
if (file_exists(global.SAVE_FILES.SAVE_DATA.NAME)) {
	image_index = 2;
    // TODO: These values seem to be unused. See TODO on Draw GUI
	profile = scr_getSaveProfile();
}
else {
	size = 0;
	name = "";
	/*text = ""
	segment = 0
	charCount = 0
	confirm = [false,0,1,c_aqua]//Confirm Y/N, Tries, Size, Color
	response = ["",0,fnt_basic_gui,tlk_default,c_gray,true]//Response, charCount, font, sound, color, can use?*/
}
if file_exists(global.SAVE_FILES.PERS_RESET.NAME) {
	ini_open(global.SAVE_FILES.PERS_RESET.NAME);
    // this value will be set when entering Bill's domain (ow_scb_0 CC)
	global.player.mabel = bool(ini_read_real(global.SAVE_FILES.PERS_RESET.KEYS.IS_MABEL, global.SAVE_FILES.PERS_RESET.KEYS.IS_MABEL, false));
	ini_close();
}
