if (self.image_alpha < 1)
{
    self.image_alpha += .05;
}

if (self.alarm[1] > -1)
{
    var angle = point_direction(obj_soul.x, obj_soul.y, x, y);
    if (angle >= 90 and angle < 180) angle -= 2;
    else if (angle >= 270 or angle < 0) angle += 2;
    else angle += irandom_range(-3, 3);

    var dist = point_distance(obj_soul.x, obj_soul.y, x, y);
    if (dist >= self.max_dist) dist -= 2;
    else if (dist <= self.min_dist) dist += 2;
    else dist += irandom_range(-2, 2);

    self.x = obj_soul.x + lengthdir_x(dist, angle);
    self.y = obj_soul.y + lengthdir_y(dist, angle);
}
