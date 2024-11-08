/// @description Picture
if global.player.beaverPic == BEAVER_PIC.NONE or global.player.beaverPic == BEAVER_PIC.GENERIC_BEAVER {
	obj_battleCore.text[1] = "You take a picture of a Beaver #with a chainsaw.&This may sell for big!"
	global.player.beaverPic = BEAVER_PIC.CHAINSAW_BEAVER;
} else {
	obj_battleCore.text[1] = "You take a picture of a Beaver #with a chainsaw.&You already had one."
}
obj_battleCore.text[0] = "You store the picture in your #vest pocket."