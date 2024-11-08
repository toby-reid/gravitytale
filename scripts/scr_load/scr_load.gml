/// @param {bool} _softload: Set to 'true' to avoid resetting certain variables, such as global.soos
function scr_load() {
	var _bin = file_bin_open("Info.save",0); // open in 'read' mode

	if (read_bin_string(_bin) != GM_version) {
		file_bin_close(_bin);
		return false;
	}
	room_goto(asset_get_index(read_bin_string(_bin)));
	window_set_caption(read_bin_string(_bin));

	{
		var _name = read_bin_string(_bin);
		var _mabel = bool(file_bin_read_byte(_bin));
		var _time = array_create(file_bin_read_byte(_bin), 0);
		for (var i = 0; i < array_length(_time); i++) _time[i] = file_bin_read_byte(_bin);
		var _kills = file_bin_read_byte(_bin);
		var _spares = file_bin_read_byte(_bin);
		var _hp = file_bin_read_byte(_bin);
		var _maxHp = file_bin_read_byte(_bin);
		var _money = read_bytes(_bin, 2);
		var _lv = file_bin_read_byte(_bin);
		var _at_df = file_bin_read_byte(_bin);
		var _bag_coupon = file_bin_read_byte(_bin);
		var _genocide = file_bin_read_byte(_bin);
		var _pic_potty = file_bin_read_byte(_bin);
		global.player = {
			name: _name,
			mabel: _mabel,
			time: _time,
			kills: _kills,
			spares: _spares,
			hp: _hp,
			maxHp: _maxHp,
			money: _money,
			lv: _lv,
			at: _at_df >> 4,
			df: _at_df & 0xf,
			bag: _bag_coupon >> 4,
			coupon: _bag_coupon & 0xf,
			genocide: _genocide,
			beaverPic: _pic_potty >> 4,
			portalPotty: _pic_potty & 0xf
		}
	}

	global.inventory = array_create(file_bin_read_byte(_bin), ITEM_NAME.NONE);
	for (var i = 0; i < array_length(global.inventory); i++) {
		global.inventory[i] = file_bin_read_byte(_bin);
	}

	global.menu = [file_bin_read_byte(_bin), file_bin_read_byte(_bin)];
	global.battleTimer = read_bytes(_bin, 2);

	var size = file_bin_read_byte(_bin);
	global.enemy_killed = array_create(size, false);
	global.enemy_spared = array_create(size, false);
	var enemy_killed = 0;
	var enemy_spared = 0;
	for (var i = 8 * floor(size / 8); i >= 0; i -= 8) {
		enemy_killed += (file_bin_read_byte(_bin) << i);
		enemy_spared += (file_bin_read_byte(_bin) << i);
	}
	for (var i = size - 1; i >= 0; i--) {
		global.enemy_killed[i] = bool(enemy_killed & 0x1);
		enemy_killed = enemy_killed >> 1;
		global.enemy_spared[i] = bool(enemy_spared & 0x1);
		enemy_spared = enemy_spared >> 1;
	}

	for (var i = 0; i < AREA.TOTAL; i++) {
		global.areaKills[? i].killCount = file_bin_read_byte(_bin);
	}

	{
		var _x = read_bytes(_bin, 4);
		var _y = read_bytes(_bin, 4);
		global.dip_pos = [_x, _y];
	}

	var _music = asset_get_index(read_bin_string(_bin));
	if(_music != silence) {
		audio_stop_all();
		audio_play_sound(_music, 0, true);
	}

	global.soos  = file_bin_read_byte(_bin);
	global.stans = file_bin_read_byte(_bin);
	global.toby  = file_bin_read_byte(_bin);
	global.wendy = file_bin_read_byte(_bin);

	var next = file_bin_read_byte(_bin);
	global.hamstick = (next >> 4) & 0b1111;
	global.fairydust = next & 0b1111;

	global.buttSwitch = array_create(read_bytes(_bin, 2), "");
	for (var i = 0; i < array_length(global.buttSwitch); i++) {
		global.buttSwitch[i] = read_bin_string(_bin);
	}

	global.trashCan = array_create(read_bytes(_bin, 2));
	for (var i = 0; i < array_length(global.trashCan); i++) {
		global.trashCan[i] = read_bytes(_bin, 4);
	}

	file_bin_close(_bin);
	return true;
}

/// @desc Returns a string representation of the next string found in the file. Assumes _bin was already opened.
function read_bin_string(_bin) {
	var _next = file_bin_read_byte(_bin);
	var _str = "";
	for(var i = 0; i < _next; i++) {
		var _chr = file_bin_read_byte(_bin);
		if(_chr < 32) _chr += 32;
		else if(_chr >= 128) _chr -= 128;
		_str += chr(_chr - 2);
	}
	return _str;
}

/// @desc Reads the next 'count' bytes and returns the full number represented thereby.
/// @param {id.BinaryFile} _bin: A binary file already opened in Read mode
/// @param {real} count: The number of bytes to read as a single number
/// @return {real} The value that was stored in the next 'count' bytes
function read_bytes(_bin, count) {
	var total = 0;
	for (var i = 0; i < count; i++) {
		total += file_bin_read_byte(_bin);
		total = total << 8;
	}
	return (total >> 8);
}