if (global.player.genocide == RUN.ACTIVE || global.gideon >= 8)
{
    with instance_create_layer(x, y, layer, obj_sign)
    {
        text = other.text;
        sprite_index = other.sprite_index;
    }
    instance_destroy();
}
