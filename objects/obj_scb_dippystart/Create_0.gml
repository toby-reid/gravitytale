if (array_contains(global.oneTimeInstances, id))
{
    instance_destroy(id, false);
    exit;
}

with obj_dipper
{
    canMove = false
    image_angle = 90
    image_index = 0
    dir = 0
}
alarm[0] = 120
global.dir = 0
