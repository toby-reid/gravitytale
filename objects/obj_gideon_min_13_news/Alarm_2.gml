/// @desc Emerge
--y;
++self.drawy;
if (self.drawy >= sprite_height)
{
    alarm[4] = 60;
}
else
{
    alarm[2] = self.emerge_speed;
}
