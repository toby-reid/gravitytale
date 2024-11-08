/// @desc
/// Formats and returns a time in the form HH:MM:SS.
/// Time values default to global.player.time[] values.
function scr_format_time( hours=global.player.time[TIME.HOURS],
						minutes=global.player.time[TIME.MINUTES],
						seconds=global.player.time[TIME.SECONDS]) {
	var str_hours   = string(hours);
	var str_minutes = string(minutes);
	var str_seconds = string(seconds);
	if (string_length(str_hours) < 2)   str_hours   = "0" + str_hours;
	if (string_length(str_minutes) < 2) str_minutes = "0" + str_minutes;
	if (string_length(str_seconds) < 2) str_seconds = "0" + str_seconds;
	return string_join(":", str_hours, str_minutes, str_seconds);
}

/// @desc
/// Formats and returns a time in the form HH:MM:SS.
/// If the given array has fewer than 3 elements, it will be padded with 0s
/// at the beginning; if it has more than 3 elements, all elements after the
/// third will be ignored.
/// @param {Array<Real>} time: An array containing [hours, minutes, seconds]
function scr_format_time_array(time) {
	while (array_length(time) < 3) time = array_concat([0], time);
	return scr_format_time(time[0], time[1], time[2]);
}