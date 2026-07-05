/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4
{
    var enemy_count = instance_number(obj_enemy);
    if (self.timer == 360 or (enemy_count == 2 and self.timer == 270))
    {
        ++global.stage[0];
    }
    else
    {
        var make_mosquito = false;
        if (enemy_count == 1) make_mosquito = (self.timer mod 60 == 0);
        else make_mosquito = (instance_find(obj_enemy, 0) == id) ? (self.timer mod 90 == 0) : ((self.timer + 45) mod 90 == 0);
        if (make_mosquito)
        {
            with instance_create_layer(obj_soul.x, obj_soul.y, layer, obj_atk_mosquito) host = other;
        }
    }
    ++self.timer;
}

self.image_xscale = (self.maxhp >= 5) ? 2 : (0.75 + (0.25 * self.maxhp));
self.image_yscale = self.image_xscale;
if (irandom(2) == 0)
{
    self.x = self.xstart + irandom_range(-2, 2);
    self.y = self.ystart + irandom_range(-2, 2);
}
