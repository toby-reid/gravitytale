/// @param {string} rmName: The name of the current room, to be used in Prof.save
function scr_save(rmName="Unknown", _music=silence, _playsound=true) {
	file_delete("Prof.save"); // ini for obj_startMenu info
	file_delete("Info.save"); // bitfile for in-game global variables
	// Rest.save is the information that stays between Resets & Saves, like how many times a person has killed you
	
	ini_open("Prof.save");
	
	ini_write_string("Profile","NM",global.player[player.name]);
	ini_write_real("Profile","LV",global.player[player.lv]);
	ini_write_string("Profile","RM",rmName);
		
	var time = string(global.player[player.seconds]);
	while(string_length(time) < 2) time = "0" + time;
	time = string(global.player[player.minutes]) + ":" + time;
	while(string_length(time) < 5) time = "0" + time;
	time = string(global.player[player.hours]) + ":" + time;
	while(string_length(time) < 8) time = "0" + time;
	// Keep length low if very long
	if(string_length(time) > 10) time = string_copy(time,1,string_length(time)-3); // removes seconds
	if(string_length(time) > 10) time = string_copy(time,1,string_length(time)-3); // removes minutes
	ini_write_string("Profile","TM",time);
	with obj_save savedTime = time;
	
	ini_close();
		
		
	var _bin = file_bin_open("Info.save",1); // opens new binary file in write mode
		
	// The following must be read/written in order.
	scr_write_bin_string(_bin, GM_version);
	scr_write_bin_string(_bin, room_get_name(room));
	scr_write_bin_string(_bin, window_get_caption());
		
	scr_write_bin_string(_bin, global.player[player.name]);
	file_bin_write_byte(_bin, player.total);
	for(var i = 1; i < player.total; i++) file_bin_write_byte(_bin, global.player[i]);
	for(var i = 0; i < 8; i++) {
		file_bin_write_byte(_bin, global.inventory[i]);
	}
		
	file_bin_write_byte(_bin, global.menu[0]);
	file_bin_write_byte(_bin, global.menu[1]);
	file_bin_write_byte(_bin, global.battleTimer);
		
	// Write a set of bytes that directly interprets a 1 as 'true' and 0 as 'false'
	var _killed = 0;
	var _spared = 0;
	file_bin_write_byte(_bin, enemy.total);
	for(var i = 0; i < enemy.total; i++) {
		_killed *= 2; // shifts the binary left by one
		if(global.killed[i]) _killed++; // turns the last into a 1 if killed
		_spared *= 2;
		if(global.spared[i]) _spared++;
	}
	for(var i = 8 * floor(enemy.total / 8); i >= 0; i -= 8) {
		file_bin_write_byte(_bin, (_killed >> i) & 0b11111111); // bit-shifts _spared right, then 'and's it with 0xff
		// Potential issue here in that it might write more than 1 byte for those after the first
		file_bin_write_byte(_bin, (_spared >> i) & 0b11111111);
	}
	file_bin_write_byte(_bin, area.total);
	for(var i = 0; i < area.total; i++) file_bin_write_byte(_bin, global.areaKilled[i]);
	
	if(instance_exists(obj_dipper)) {
		var _x = obj_dipper.x;
		file_bin_write_byte(_bin, _x >> 8);
		file_bin_write_byte(_bin, _x & 255);
		var _y = obj_dipper.y;
		file_bin_write_byte(_bin, _y >> 8);
		file_bin_write_byte(_bin, _y & 255);
	}
	else for(var i = 0; i < 4; i++) file_bin_write_byte(_bin, 255); // writes the maximum value for Dipper's x/y
	
	scr_write_bin_string(_bin, audio_get_name(_music));
		
	if(!variable_global_exists("soos"))  global.soos = 0;
	if(!variable_global_exists("stans")) global.stans = 0;
	if(!variable_global_exists("toby"))  global.toby = 0;
	if(!variable_global_exists("wendy")) global.wendy = 0;
	file_bin_write_byte(_bin, global.soos);
	file_bin_write_byte(_bin, global.stans);
	file_bin_write_byte(_bin, global.toby);
	file_bin_write_byte(_bin, global.wendy);
		
	if(!variable_global_exists("hamstick")) global.hamstick = false;
	if(!variable_global_exists("fairydust")) global.fairydust = false;
	file_bin_write_byte(_bin, (global.hamstick << 4) + global.fairydust);
		
	if(!variable_global_exists("buttSwitch")) global.buttSwitch = [];
	file_bin_write_byte(_bin, array_length(global.buttSwitch));
	for(var i = 0; i < array_length(global.buttSwitch); i++) scr_write_bin_string(_bin, room_get_name(global.buttSwitch[i]));
		
	if(!variable_global_exists("trashCan")) global.trashCan = [];
	file_bin_write_byte(_bin, array_length(global.trashCan));
	for(var i = 0; i < array_length(global.trashCan); i++) scr_write_bin_string(_bin, global.trashCan[i]);
		
	file_bin_close(_bin);
	
	if(_playsound) audio_play_sound(sfx_save,0,false);
}