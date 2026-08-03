if (clone_height < sprite_get_height(obj_dipper.sprite_index) + 5)
{
    ++clone_height;
    alarm[0] = 10;
}
else if (clone_offset < 8)
{
    ++clone_offset;
    alarm[0] = 5;
}
else
{
    global.has_clone = true; // persists across rooms
    instance_create_layer(x + 75, y + 10, obj_dipper.layer, obj_dipperClone, {desaturate_strength: desaturate_strength});
    obj_dipper.dir = DIRECTION.DOWN;
    obj_dipper.canMove = true;
    obj_dipper.image_angle = 0;
    obj_dipper.x = x + 35;
    obj_dipper.y = y + 21;
    image_index = 2;
    clone_height = 0;
    clone_offset = 0;
}
