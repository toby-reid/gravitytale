/// @description Costume: Normal hat
if (global.player.df != AT_DF.NONE)
{
	global.player.costume = (global.player.costume == COSTUME.DF_NORMAL) ? COSTUME.DEFAULT : COSTUME.DF_NORMAL;
    with obj_dipper set_costume();
	alarm[3] = 30;
}
