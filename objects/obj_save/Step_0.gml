if (state == 1)
{
    savebox_size += 0.1;
    if (savebox_size >= 1)
    {
        savebox_size = 1;
        ++state;
    }
}
else if (state == 4)
{
    savebox_size -= 0.1;
    if (savebox_size <= 0)
    {
        savebox_size = 0;
        state = 0;
        obj_dipper.canMove = true;
    }
}
