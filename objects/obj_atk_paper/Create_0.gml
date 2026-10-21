event_inherited();
paper_cut = function()
{
    if (obj_soul.alarm[0] == -1)
    {
        instance_create_layer(0, 0, layer, obj_tnt_paperCut);
        obj_soul.alarm[0] = 30;
    }
}
