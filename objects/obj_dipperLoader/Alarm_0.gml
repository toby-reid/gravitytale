if (instance_exists(obj_dipper))
{
    if (!is_undefined(dipper_x))
    {
        obj_dipper.x = dipper_x;
    }
    if (!is_undefined(dipper_y))
    {
        obj_dipper.y = dipper_y;
    }
}
instance_destroy();
