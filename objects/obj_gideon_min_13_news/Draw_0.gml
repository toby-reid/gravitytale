if (self.drawy == 0)
{
    event_inherited();
}
else
{
    draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, self.drawy, x - sprite_xoffset, y - sprite_yoffset);
}
if (self.showing_doll)
{
    // TODO: Draw a gideon doll, perhaps in my hand
}
