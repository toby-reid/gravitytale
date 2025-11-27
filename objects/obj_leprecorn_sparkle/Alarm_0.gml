if (self.image_index == self.image_number - 1)
{
    instance_destroy();
}
else
{
    ++self.image_index;
    self.alarm[0] = self.img_rate;
}
