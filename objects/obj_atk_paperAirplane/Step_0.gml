if (xscale_mult != 1)
{
    xscale_mult += 0.05;
    if (xscale_mult >= 1)
    {
        xscale_mult = 1;
    }
}
else if (alarm[0] == -1)
{
    // even if they're pointed right at soul, it wobbles a bit as if in the wind
    var _dist = point_distance(x, y, obj_soul.x, obj_soul.y);
    var _diff = point_direction(x, y, obj_soul.x, obj_soul.y) - (direction % 360);
    if (abs(_diff) > 45 and _dist < 120)
    {
        // do nothing; give a little distance
    }
    else if (_diff != 0 && abs(angular_momentum) < angular_acceleration)
    {
        angular_momentum = (_diff < 0) ? -angular_acceleration : angular_acceleration;
    }
    else if (abs(_diff) < abs(angular_momentum))
    {
        angular_momentum /= 4;
    }
    else if (abs(angular_momentum) < 5 && abs(_diff) > 45)
    {
        angular_momentum += (angular_momentum < 0) ? -angular_acceleration : angular_acceleration;
    }
    direction = (direction + angular_momentum) % 360;
}

switch (((direction + 22) div 45) mod 8)
{
    case 0:
        image_index = 2;
        image_xscale = 2;
        image_yscale = 2;
        break;
    case 1:
        image_index = 1;
        image_xscale = 2;
        image_yscale = 2;
        break;
    case 2:
        image_index = 0;
        image_yscale = 2;
        break;
    case 3:
        image_index = 1;
        image_xscale = -2;
        image_yscale = 2;
        break;
    case 4:
        image_index = 2;
        image_xscale = -2;
        image_yscale = 2;
        break;
    case 5:
        image_index = 3;
        image_xscale = -2;
        image_yscale = 2;
        break;
    case 6:
        image_index = 0;
        image_yscale = -2;
        break;
    case 7:
        image_index = 3;
        image_xscale = 2;
        image_yscale = 2;
        break;
}
