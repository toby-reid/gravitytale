alarm[0] = stage_speed;
stage = 0;
STAGE_COUNT = 3;
if (biggerize)
{
    image_xscale = 0;
    image_yscale = 0;
}
else
{
    image_xscale = STAGE_COUNT;
    image_yscale = STAGE_COUNT;
    image_alpha = 0;
}
grow_rate = 4 / stage_speed;
