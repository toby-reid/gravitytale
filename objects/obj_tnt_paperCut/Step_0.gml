if (grow_rate != 0)
{
    size_proportion += grow_rate;
    if (size_proportion >= 1)
    {
        stop_grow();
    }
}
