/// @desc Writes a length byte, then each character in the string as a byte. Assumes the file is already opened.
function scr_write_bin_string(_bin, _str) {
	file_bin_write_byte(_bin, string_length(_str));
	for(var i = 1; i <= string_length(_str); i++) {
		var _ord = string_ord_at(_str, i) + 2;
		if(32 <= _ord and _ord < 64 and irandom(1) == 0) 
			file_bin_write_byte(_bin, _ord - 32);
		else
			file_bin_write_byte(_bin, _ord + 128*irandom(1));
	}
}