// TODO: Could this object be a good replacement for the current obj_dipper teleportation scheme?
// i.e., how we avoid getting trapped within obj_collide right now
oust = function(_id)
{
    _id.x += dir_get_x(oust_direction);
    _id.y += dir_get_y(oust_direction);
}
