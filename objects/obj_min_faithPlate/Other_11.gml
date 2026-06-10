/// @desc Set image blend

if (!self.is_active)
{
    self.image_blend = c_grey;
}
else if (self.is_strong and self.is_reversed)
{
    self.image_blend = c_orange;
}
else if (self.is_strong)
{
    self.image_blend = c_fuchsia;
}
else if (self.is_reversed)
{
    self.image_blend = c_yellow;
}
else
{
    self.image_blend = c_aqua;
}
