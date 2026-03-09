draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, self.drawy, x + sprite_xoffset, y + sprite_yoffset);
var _face_index = (self.face == spr_gideon_tv_static) ? irandom(sprite_get_number(self.face) - 1) : 0;
// The face will be obscured by the countertop, so we needn't worry about draw_sprite_part
draw_sprite(self.face, _face_index, x, y);
// Don't bother with drawing the arm right. Just start with the arm retracted, and we'll deal with it from there
draw_sprite(self.arm, self.arm_index, self.x - 4, self.y + 6);
