if (self.is_active and other.canMove) // i.e., not greyed out
{
    other.canMove = false;
    other.x = self.x + 10;
    other.y = self.y + 6;
    if (!self.is_any_direction)
    {
        other.dir = self.dir;
    }
    self.alarm[2] = 10;
}
