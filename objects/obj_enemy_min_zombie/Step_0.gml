/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4
{
    if (self.timer == 480 or (self.timer == 360 and instance_number(obj_battleEnemy) > 1))
    {
        ++global.stage[0];
    }
    else if (self.timer mod 60 == 0 or (self.timer mod 30 == 0 and instance_number(obj_battleEnemy) == 1))
    {
        var dir = irandom(359);
        var dist = 240;
		with instance_create_layer(obj_battleBox.x + lengthdir_x(dist, dir), obj_battleBox.y + lengthdir_y(dist, dir), layer, obj_atk_danAxe)
        {
            sprite_index = spr_atk_ironTools;
            image_index = irandom(image_number - 1);
            at = other.at;
        }
    }
    ++self.timer;
}