/// @desc Returns a string representation of the next string found in the file. Assumes _bin was already opened.
function scr_read_bin_string(_bin) {
	var _next = file_bin_read_byte(_bin);
	var _str = "";
	for(var i = 0; i < _next; i++) _str += chr(file_bin_read_byte(_bin) - 2);
	return _str;
}