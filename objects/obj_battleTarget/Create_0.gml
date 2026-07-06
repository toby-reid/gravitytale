image_speed = 0;
alarm[0] = obj_battleCore.enemies_glittered ? 20 : irandom_range(5, 15);
total_distance_to_travel = 560;
travel_time = 70;
var _halfway = (total_distance_to_travel div 2) - 3; // arbitrary -3 to get it in the right spot
if (irandom(1) == 0)
{
    direction = 0;
    x -= _halfway;
    image_xscale = 2;
}
else
{
    direction = 180;
    x += _halfway;
    image_xscale = -2;
}
image_yscale = 2;

instance_create_layer(320, 249, layer, obj_nyarfGun);
array_foreach([1, 2, 3, 5], function(_dmg) {
    with instance_create_layer(320, 320, layer, obj_battleTarget_dmg)
    {
        set_dmg(_dmg);
    }
});

stop_the_bar = function(_set_dmg = undefined)
{
    alarm[0] = -1;
    speed = 0;
    image_speed = 1;
    var _dmg = 0;
    if (is_undefined(_set_dmg))
    {
        with (obj_battleTarget_dmg)
        {
            if (place_meeting(x, y, other))
            {
                _dmg = max(_dmg, damage);
            }
        }
    }
    else
    {
        _dmg = _set_dmg;
    }
    global.stage[4] = (global.player.at == AT_DF.UPGRADE) ? (_dmg + _dmg) : _dmg;
    alarm[1] = -1;
}
