/// @description Peek-a-boo!

if (self.drawy < 36)
{
    --self.y;
    ++self.drawy;
    self.alarm[3] = 5;
}
else
{
    self.alarm[2] = 60;
}
