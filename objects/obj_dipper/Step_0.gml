image_speed = 0;
if (canMove)
{
    var _speed = keyboard_check(vk_shift) ? 2 : 1;
    for (var _dir = 0; _dir < DIRECTION.ALL; ++_dir)
    {
        m_check_move(_dir, _speed);
    }
    if (fixCollide > 0) // TODO: Investigate legacy code...
    {
        fixCollide--;
        while (place_meeting(x, y, obj_collide))
        {
            x += dir_get_x(dir);
            y += dir_get_y(dir);
        }
    }
}
moving = (x != xprevious || y != yprevious);
if (image_speed == 0)
{
    image_index -= image_index % 2;
}
image_index = clamp_image_index();
