///@desc Genocide Music Reset
if global.player[player.runActive] > 0 {
	if global.player[player.runActive]==1 if global.player[player.kills]>0 global.player[player.runActive]=0
	if global.player[player.runActive] == 2 if global.player[player.spares] > 0 {
		global.player[player.runActive] = 0
		scr_genoMusic()
	}
}