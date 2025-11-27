if (self.image_xscale < 2)
{
    self.image_xscale += .05;
    self.image_yscale += .05;
    if (self.image_xscale == 2)
    {
        self.alarm[0] = irandom_range(10, 30);
    }
}
