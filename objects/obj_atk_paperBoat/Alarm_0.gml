/// @desc PK Rockin
if (image_angle == 0)
{
    image_angle += rocking_left ? rocking_severity : -rocking_severity;
}
else
{
    rocking_left = image_angle < 0;
    image_angle = 0;
}
alarm[0] = rocking_speed;
