if (grow_rate != 0)
{
    size_proportion += grow_rate;
    if (size_proportion >= 1)
    {
        stop_grow();
    }
}

if (is_leader)
{
    if (ready_for_damage)
    {
        if (global.stage[0] == 4 && !instance_exists(obj_textBubble))
        {
            var _flash_time = 5;
            for (var i = 0, _paperCut_count = instance_number(object_index); i < _paperCut_count; ++i)
            {
                instance_find(object_index, i).alarm[0] = (60 * i) + 1;
            }
            ready_for_damage = false;
        }
    }
    else if (global.stage[0] == 5)
    {
        ready_for_damage = true;
    }
}
