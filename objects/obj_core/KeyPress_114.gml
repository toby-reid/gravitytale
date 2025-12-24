/// @description Costume: Upgraded hat
if (global.player.df == AT_DF.UPGRADE)
{
	global.player.costume = (global.player.costume == COSTUME.DF_UPGRADE) ? COSTUME.DEFAULT : COSTUME.DF_UPGRADE;
	alarm[3] = 30;
}
