/// @description Spin timer
if (self.alarm[0] > -1)
{
    obj_dipper.dir = (obj_dipper.dir + 1) mod 4;
    self.alarm[1] = self.turnTime;
}
