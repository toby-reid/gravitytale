if (state == 1)
{
    size += 0.1;
    if (size >= 1)
    {
        size = 1;
        ++state;
    }
}
else if (state == 4)
{
    size -= 0.1;
    if (size <= 0)
    {
        size = 0;
        state = 0;
        obj_dipper.canMove = true;
    }
}
