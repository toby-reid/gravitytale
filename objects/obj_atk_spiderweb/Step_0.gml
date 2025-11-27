if (instance_exists(obj_soul)) with obj_soul
{
    if (not place_meeting(x, y, obj_atk_spiderweb))
    {
        is_slow = false;
    }
}
