if (self.drawy == 0)
{
    event_inherited();
}
else
{
    draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, self.drawy, x - sprite_xoffset, y - sprite_yoffset);
}
if (self.showing_doll && self.arm == spr_gideon_tv_arm_talk)
{
    var _doll_offset = (self.arm_index == 0) ? [-24, -17] : [-30, -8];
    draw_sprite(spr_gideon_doll, 0, x + _doll_offset[0], y + _doll_offset[1]);
    if (self.flaming_doll)
    {
        draw_sprite(spr_flame_small, flame_index, x + _doll_offset[0], y + _doll_offset[1]);
    }
}
