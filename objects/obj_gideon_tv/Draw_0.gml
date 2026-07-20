draw_self();
if (self.face != -1)
{
    var _face_index = (self.face == spr_gideon_tv_static) ? irandom(sprite_get_number(self.face) - 1) : 0;
    draw_sprite(self.face, _face_index, self.x, self.y);
}
draw_sprite(self.arm, self.arm_index, self.x - 4, self.y + 6);
