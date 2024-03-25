/// @desc Writes a length byte, then each character in the string as a byte. Assumes the file is already opened.
function scr_write_bin_string(_bin, _str) {
	file_bin_write_byte(_bin, string_length(_str));
	for(var i = 1; i <= string_length(_str); i++) {
		file_bin_write_byte(_bin, string_ord_at(_str, i));
	}
}