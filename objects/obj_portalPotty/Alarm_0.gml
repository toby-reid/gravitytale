if (destination != PP_DESTINATION.NONE)
{
    alpha += 0.025;
}
else if (global.teleport)
{
    alpha -= 0.025;
}

if (alpha > 0 and alpha < 1)
{
    alarm[0] = 1
}
else if (alpha <= 0)
{
    alpha = 0;
}
else
{
    alpha = 1;
}
/// @desc Alpha levels
