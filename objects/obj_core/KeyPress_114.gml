/// @description Costume: Upgraded hat
if (global.player.df == AT_DF.UPGRADE)
{
	global.player.costume = (global.player.costume == COSTUME.DF_UPGRADE) ? COSTUME.DEFAULT : COSTUME.DF_UPGRADE;
    with obj_dipper set_costume();
	alarm[3] = 30;
}
