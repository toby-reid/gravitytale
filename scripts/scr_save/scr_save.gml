/// @param {string} rmName: The name of the current room, to be used in Prof.save
function scr_save(rmName="Unknown", _music=silence, _playsound=true) {
	file_delete("Prof.save"); // ini for obj_startMenu info
	file_delete("Info.save"); // bitfile for in-game global variables
	// Rest.save is the information that stays between Resets & Saves, like how many times a person has killed you

	ini_open("Prof.save");
	ini_write_string("Profile","NM",global.player.name);
	ini_write_real("Profile","LV",global.player.lv);
	ini_write_string("Profile","RM",rmName);
	ini_write_string("Profile","TM",scr_format_time());
	ini_close();

	var _bin = file_bin_open("Info.save", 1); // opens new binary file in write mode

	// The following must be read/written in order.
	write_bin_string(_bin, GM_version);
	write_bin_string(_bin, room_get_name(room));
	write_bin_string(_bin, window_get_caption());

	write_bin_string(_bin, global.player.name);
	file_bin_write_byte(_bin, global.player.mabel);
	file_bin_write_byte(_bin, array_length(global.player.time));
	for (var i = 0; i < array_length(global.player.time); i++) {
		file_bin_write_byte(_bin, global.player.time[i]);
	}
	file_bin_write_byte(_bin, global.player.kills);
	file_bin_write_byte(_bin, global.player.spares);
	file_bin_write_byte(_bin, global.player.hp);
	file_bin_write_byte(_bin, global.player.maxHp);
	write_bytes(_bin, global.player.money, 2);
	file_bin_write_byte(_bin, global.player.lv);
	var at_df = (global.player.at << 4) + global.player.df;
	file_bin_write_byte(_bin, at_df);
	var bonus = (global.player.bag << 4) + global.player.coupon;
	file_bin_write_byte(_bin, bonus);
	file_bin_write_byte(_bin, global.player.genocide);
	var progress = (global.player.beaverPic << 4) + global.player.portalPotty;
	file_bin_write_byte(_bin, progress);

	file_bin_write_byte(_bin, array_length(global.inventory));
	for(var i = 0; i < array_length(global.inventory); i++) {
		file_bin_write_byte(_bin, global.inventory[i]);
	}

	file_bin_write_byte(_bin, global.menu[0]);
	file_bin_write_byte(_bin, global.menu[1]);
	write_bytes(_bin, global.battleTimer, 2);

	// Write a set of bytes that directly interprets a 1 as 'true' and 0 as 'false'
	var enemy_killed = 0;
	var enemy_spared = 0;
	file_bin_write_byte(_bin, ENEMY.TOTAL); // counts the number of bits to write/read
	for(var i = 0; i < ENEMY.TOTAL; i++) {
		enemy_killed = enemy_killed << 1; // shift left 1 bit
		if (global.enemy_killed[i]) enemy_killed++; // turns the last bit into a 1 if killed
		enemy_spared = enemy_spared << 1;
		if (global.enemy_spared[i]) enemy_spared++;
	}
	for(var i = 8 * floor(ENEMY.TOTAL / 8); i >= 0; i -= 8) {
		file_bin_write_byte(_bin, (enemy_killed >> i) & 0xff); // retrieves the relevant bit sequence, starting at the leftmost, then &'s with 0b11111111 to get only that byte
		file_bin_write_byte(_bin, (enemy_spared >> i) & 0xff);
	}

	for (var i = 0; i < AREA.TOTAL; i++) {
		file_bin_write_byte(_bin, global.areaKills[? i].killCount);
	}

	if (instance_exists(obj_dipper)) {
		write_bytes(_bin, obj_dipper.x, 4);
		write_bytes(_bin, obj_dipper.y, 4);
	}
	else for(var i = 0; i < 8; i++) file_bin_write_byte(_bin, irandom(0xff)); // writes garbage data for Dipper's x/y

	write_bin_string(_bin, audio_get_name(_music));

	if (!variable_global_exists("soos"))  global.soos  = 0;
	if (!variable_global_exists("stans")) global.stans = 0;
	if (!variable_global_exists("toby"))  global.toby  = 0;
	if (!variable_global_exists("wendy")) global.wendy = 0;
	file_bin_write_byte(_bin, global.soos);
	file_bin_write_byte(_bin, global.stans);
	file_bin_write_byte(_bin, global.toby);
	file_bin_write_byte(_bin, global.wendy);

	if (!variable_global_exists("hamstick"))  global.hamstick  = false;
	if (!variable_global_exists("fairydust")) global.fairydust = false;
	file_bin_write_byte(_bin, (global.hamstick << 4) + global.fairydust);

	if (!variable_global_exists("buttSwitch")) global.buttSwitch = [];
	write_bytes(_bin, array_length(global.buttSwitch), 2);
	for (var i = 0; i < array_length(global.buttSwitch); i++) {
		write_bin_string(_bin, global.buttSwitch[i]);
	}

	if (!variable_global_exists("trashCan")) global.trashCan = [];
	write_bytes(_bin, array_length(global.trashCan), 2);
	for (var i = 0; i < array_length(global.trashCan); i++) {
		write_bytes(_bin, int64(global.trashCan[i]), 4);
	}

	file_bin_close(_bin);

	if (_playsound) audio_play_sound(sfx_save,0,false);
}

/// @desc Writes 2 length bytes, then each character in the string as a byte. Assumes the file is already opened.
/// @param {id.BinaryFile} _bin: A binary file already opened in Write mode
/// @param {String} _str: The string whose data are being written
function write_bin_string(_bin, _str) {
	file_bin_write_byte(_bin, string_length(_str));
	for (var i = 1; i <= string_length(_str); i++) {
		var _ord = string_ord_at(_str, i) + 2;
		if(32 <= _ord and _ord < 64 and irandom(1) == 0) 
			file_bin_write_byte(_bin, _ord - 32);
		else
			file_bin_write_byte(_bin, _ord + 128*irandom(1));
	}
}

/// @desc Writes the given value to the given file using 'count' number of bytes.
/// So, for example, if given 'count=4', it would write 'value' as a 32-bit number.
/// @param {id.BinaryFile} _bin: A binary file already opened in Write mode
/// @param {real} value: The value to write to the file
/// @param {real} count: The number of bytes to use to write 'value' to the file
function write_bytes(_bin, value, count) {
	for (var i = 0; i < count; i++) {
		var shift = ((count - 1) * 8) - (8 * i);
		file_bin_write_byte(_bin, (value >> shift) & 0xff);
	}
}