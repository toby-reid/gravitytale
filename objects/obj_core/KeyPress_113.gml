/// @description Costume: Normal hat
if (global.player.df == AT_DF.BASE or global.player.df == AT_DF.UPGRADE)
{
	global.player.costume = (global.player.costume == COSTUME.DF_NORMAL) ? COSTUME.DEFAULT : COSTUME.DF_NORMAL;
	alarm[3] = 30;
}
