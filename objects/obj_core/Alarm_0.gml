global.player[player.seconds]++
if global.player[player.seconds] == 60 {
	global.player[player.minutes]++
	global.player[player.seconds] = 0
	if global.player[player.minutes] == 60 {
		global.player[player.hours]++
		global.player[player.minutes] = 0
		if global.player[player.hours] == 100
			global.player[player.hours] = 0
	}
}
alarm[0] = 60
///@desc Gameplay Timer