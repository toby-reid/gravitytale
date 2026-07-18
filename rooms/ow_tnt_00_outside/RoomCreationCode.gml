if (global.dir != DIRECTION.LEFT)
{
    var _layer = layer_get_id("Instances");
    for (var _x = 300; _x >= 220; _x -= 40)
    {
        if (irandom(3) == 0)
        {
            with instance_create_layer(_x, 220, _layer, obj_sign)
            {
                text = [
                    "(It's a poorly-parked car.)",
                    "(Psychics must not attract #the most intelligent of #persons.)"
                ];
                sprite_index = spr_car;
                image_angle = 90;
                image_index = irandom(image_number - 1);
            }
        }
    }
    for (var _x = 300; _x >= 220; _x -= 40)
    {
        if (irandom(2) == 0)
        {
            with instance_create_layer(_x, 60, _layer, obj_sign)
            {
                text = [
                    "(It's a poorly-parked car.)",
                    "(If you come back later, #maybe it will be gone.)"
                ];
                sprite_index = spr_car;
                image_angle = 270;
                image_yscale = -1;
                image_index = irandom(image_number - 1);
            }
        }
    }
}
