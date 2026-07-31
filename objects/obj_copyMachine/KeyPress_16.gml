if (obj_dipper.canMove && instance_exists(obj_dipperClone))
{
    obj_dipperClone.swap(obj_dipper);
    dipper_classic_active = !dipper_classic_active;
}
