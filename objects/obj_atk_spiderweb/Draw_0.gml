draw_self();
if (self.image_alpha >= 0.75)
{
    if (place_meeting(x, y, obj_soul))
    {
        with obj_soul
        {
            draw_sprite(other.sprite_index, other.image_index, x, y);
            is_slow = true;
        }
    }
}
else self.image_alpha += .05;
