if (global.gideon < 22)
{
    with instance_create_layer(x, y, layer, obj_collide)
    {
        image_yscale = other.image_yscale;
    }
    instance_destroy();
    exit;
}

event_inherited();
