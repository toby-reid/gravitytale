/// @description Costume: No hat
if (global.player.df != AT_DF.NONE)
{
	global.player.costume = (global.player.costume == COSTUME.NO_DF) ? COSTUME.DEFAULT : COSTUME.NO_DF;
	alarm[3] = 30;
}
