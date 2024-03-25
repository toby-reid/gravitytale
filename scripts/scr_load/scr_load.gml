/// @param {bool} _softload: Set to 'true' to avoid resetting certain variables, such as global.soos
function scr_load(_softload=false) {
	var _bin = file_bin_open("Info.save",0);
		
	if(scr_read_bin_string(_bin) != GM_version) {
		file_bin_close(_bin);
		return false;
	}
	room_goto(asset_get_index(scr_read_bin_string(_bin)));
	window_set_caption(scr_read_bin_string(_bin));
		
	global.player[player.name] = scr_read_bin_string(_bin);
	var _next = file_bin_read_byte(_bin);
	for(var i = 1; i < _next; i++) {
		if(_softload and (i == player.hours or i == player.minutes or i == player.seconds)) file_bin_read_byte(_bin);
		else global.player[i] = file_bin_read_byte(_bin);
	}
	for(var i = 0; i < 8; i++) {
		if(!_softload) global.inventory[i] = file_bin_read_byte(_bin);
		else file_bin_read_byte(_bin);
	}
	
	if(_softload) {file_bin_read_byte(_bin); file_bin_read_byte(_bin);}
	else global.menu = [file_bin_read_byte(_bin), file_bin_read_byte(_bin)];
	global.battleTimer = file_bin_read_byte(_bin);
		
	_next = file_bin_read_byte(_bin);
	var _killed = 0;
	var _spared = 0;
	for(var i = 8 * floor(_next / 8); i >= 0; i -= 8) {
		_killed += (file_bin_read_byte(_bin) << i);
		_spared += (file_bin_read_byte(_bin) << i);
	}
	for(var i = _next - 1; i >= 0; i--) {
		global.killed[i] = (_killed % 2 == 1);
		_killed = floor(_killed / 2);
		global.spared[i] = (_spared % 2 == 1);
		_spared = floor(_spared / 2);
	}
	_next = file_bin_read_byte(_bin);
	for(var i = 0; i < _next; i++) global.areaKilled[i] = file_bin_read_byte(_bin);
		
	if(!_softload) {
		global.soos = file_bin_read_byte(_bin);
		global.stans = file_bin_read_byte(_bin);
		global.toby = file_bin_read_byte(_bin);
		global.wendy = file_bin_read_byte(_bin);
		
		_next = file_bin_read_byte(_bin);
		global.hamstick = (_next >> 4) & 0b1111;
		global.fairydust = _next & 0b1111;
		
		_next = file_bin_read_byte(_bin);
		for(var i = 0; i < _next; i++) global.runemy[i] = file_bin_read_byte(_bin);
		
		_next = file_bin_read_byte(_bin);
		for(var i = 0; i < _next; i++) global.buttSwitch[i] = asset_get_index(scr_read_bin_string(_bin));
		
		_next = file_bin_read_byte(_bin);
		for(var i = 0; i < _next; i++) global.trashCan[i] = file_bin_read_byte(_bin);
	}
		
	file_bin_close(_bin);
	return true;
}