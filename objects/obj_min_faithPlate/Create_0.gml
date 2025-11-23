self.launchTime = 40;
self.turnTime = self.launchTime / 4;
self.delta_y = 0.2;

if (self.is_any_direction)
{
    self.sprite_index = spr_min_faithPlate_anyDir;
}
else if (self.is_reversed)
{
    switch (self.dir)
    {
        case 0: self.sprite_index = spr_min_faithPlate_r_reversed; break;
        case 1: self.sprite_index = spr_min_faithPlate_u_reversed; break;
        case 2: self.sprite_index = spr_min_faithPlate_l_reversed; break;
        case 3: self.sprite_index = spr_min_faithPlate_d_reversed; break;
    }
}
else switch (self.dir)
{
    case 0: self.sprite_index = spr_min_faithPlate_r; break;
    case 1: self.sprite_index = spr_min_faithPlate_u; break;
    case 2: self.sprite_index = spr_min_faithPlate_l; break;
    case 3: self.sprite_index = spr_min_faithPlate_d; break;
}

if (!self.is_active)
    self.image_blend = c_ltgrey;
else if (self.is_strong and self.is_reversed)
    self.image_blend = c_orange;
else if (self.is_strong)
    self.image_blend = c_fuchsia;
else if (self.is_reversed)
    self.image_blend = c_yellow;
else
    self.image_blend = c_aqua;
