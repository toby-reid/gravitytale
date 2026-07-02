self.launchTime = 40;
self.turnTime = self.launchTime div 4;
self.delta_y = 0.2;
self.dipper_set_dir = false;

if (self.is_any_direction)
{
    self.sprite_index = spr_min_faithPlate_anyDir;
}
else if (self.is_reversed)
{
    switch (self.dir)
    {
        case DIRECTION.RIGHT: self.sprite_index = spr_min_faithPlate_r_reversed; break;
        case DIRECTION.UP:    self.sprite_index = spr_min_faithPlate_u_reversed; break;
        case DIRECTION.LEFT:  self.sprite_index = spr_min_faithPlate_l_reversed; break;
        case DIRECTION.DOWN:  self.sprite_index = spr_min_faithPlate_d_reversed; break;
    }
}
else switch (self.dir)
{
    case DIRECTION.RIGHT: self.sprite_index = spr_min_faithPlate_r; break;
    case DIRECTION.UP:    self.sprite_index = spr_min_faithPlate_u; break;
    case DIRECTION.LEFT:  self.sprite_index = spr_min_faithPlate_l; break;
    case DIRECTION.DOWN:  self.sprite_index = spr_min_faithPlate_d; break;
}

set_active = function(_set_active)
{
    // always flash; assume the caller has already checked as necessary
    self.is_active = _set_active;
    self.image_blend = self.is_active ? c_white : c_dkgrey;
    self.alarm[3] = 15;
}
toggle_active = function() { set_active(!is_active); }

set_color = function()
{
    if (!self.is_active)
    {
        self.image_blend = c_grey;
    }
    else if ((self.is_strong || self.short_strong) and self.is_reversed)
    {
        self.image_blend = c_orange;
    }
    else if (self.is_strong || self.short_strong)
    {
        self.image_blend = c_fuchsia;
    }
    else if (self.is_reversed)
    {
        self.image_blend = c_lime;
    }
    else
    {
        self.image_blend = c_aqua;
    }
}
set_color();
