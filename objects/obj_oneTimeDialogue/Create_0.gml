if (!variable_global_exists("trashCan"))
{
    global.trashCan = []; // array of IDs
}
else
{
    for (var i = 0, _trashCan_count = array_length(global.trashCan); i < _trashCan_count; ++i)
    {
        if (global.trashCan[i] == id)
        {
            instance_destroy();
            exit;
        }
    }
}
