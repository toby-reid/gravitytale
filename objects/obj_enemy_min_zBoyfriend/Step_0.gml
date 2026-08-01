/// @description Attack
if (image_alpha == 1 && !instance_exists(obj_textBubble_old) && global.stage[0] == 4)
{
    if (timer == 360)
    {
        ++global.stage[0];
    }
    else if (timer % 20 == 0)
    {
        var _dir = irandom(359);
        var _dist = 240;
        with instance_create_layer(obj_battleBox.x + lengthdir_x(_dist, _dir), obj_battleBox.y + lengthdir_y(_dist, _dir), layer, obj_atk_danAxe)
        {
            sprite_index = spr_atk_ironTools;
            image_index = irandom(image_number - 1);
            image_angle = 90 * irandom(3);
            alarm[0] = -1; // don't spin
            speed = 3; // a little faster than normal
            at = other.at;
        }
    }
    ++timer;
}
