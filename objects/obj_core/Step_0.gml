///@desc Genocide Abort Indicator (spares)
if ((global.player.genocide == RUN.ACTIVE) and (global.player.spares > 0)) {
	global.player.genocide = RUN.ABORTED;
	scr_genoMusic();
}
