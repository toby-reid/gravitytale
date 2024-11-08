if !audio_is_playing(mus_menu) {
	audio_stop_all();
	audio_play_sound(mus_menu,0,true);
}
if(file_exists("Info.save")) {
	image_index = 2;
	ini_open("Prof.save");
		nm = ini_read_string("Profile","NM","ERROR");
		lv = ini_read_string("Profile","LV","00");
		time = ini_read_string("Profile","TM","00:00:00");
		rm = ini_read_string("Profile","RM","ERROR");
	ini_close();
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
if file_exists("Reset.save") {
	ini_open("Reset.save");
	global.player.mabel = bool(ini_read_real("State","M",false));//this value will be set when creating the character
	ini_close();
}