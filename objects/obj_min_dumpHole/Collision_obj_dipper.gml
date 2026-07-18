if (other.canMove)
{
    if (other.image_alpha > 0.1)
    {
        other.image_alpha -= 0.01;
    }
    else if (other.image_alpha > 0)
    {
        with instance_create_layer(x, y, layer, obj_toRoom)
        {
            goto = ow_min_02_start;
            music = mus_medium;
        }
        other.image_alpha = 0;
    }
}
