/// @description Death & hat

// Inherit the parent event
event_inherited();

if (self.bucket or self.cone)
{
    var hat = (self.bucket) ? spr_zombie_bucket : spr_zombie_cone;
    if (self.hp <= 10)
    {
        self.hat_alpha -= 0.01;
        if (self.hat_alpha <= 0.01)
        {
            self.bucket = false;
            self.cone = false;
        }
    }
    draw_sprite_ext(hat, 0, x - 20, y - 120, 2, 2, 0, self.image_blend, min(self.image_alpha, self.hat_alpha));
}
