if (self.image_alpha >= 1)
{
    self.x = other.x;
    self.y = other.y;
    if (self.alarm[0] == -1) self.alarm[0] = 60;
    self.alarm[1] = -1;
    self.alarm[2] = -1;
    self.speed = 0;
}
