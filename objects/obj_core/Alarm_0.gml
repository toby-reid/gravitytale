///@desc Gameplay Timer
global.player.time[TIME.SECONDS]++;
if (global.player.time[TIME.SECONDS] == 60) {
	global.player.time[TIME.SECONDS] = 0;
	global.player.time[TIME.MINUTES]++;
	if (global.player.time[TIME.MINUTES] == 60) {
		global.player.time[TIME.MINUTES] = 0;
		global.player.time[TIME.HOURS]++;
		if (global.player.time[TIME.HOURS] == 100) { // cannot exceed 128 for saving as a single byte
			global.player.time[TIME.HOURS] = 0;
		}
	}
}
alarm[0] = 60;
