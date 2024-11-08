alarm[0] = irandom(59) + 1
stage = (   (global.player.beaverPic == BEAVER_PIC.NONE)
		 or (global.player.beaverPic == BEAVER_PIC.GENERIC_BEAVER)
		 or (global.player.beaverPic == BEAVER_PIC.CHAINSAW_BEAVER))
		? 0 : 7;
alpha = 0
if global.player.genocide == RUN.ACTIVE {
	// If we've already sold the picture, or have no chance of returning to get it
	if (global.player.beaverPic != BEAVER_PIC.CHAINSAW_BEAVER) {
		instance_destroy();
	}
}
