if (self.image_alpha < 1)
{
    self.image_alpha += .02;
    if (self.image_alpha == 1)
    {
        self.alarm[0] = self.wait_time;
        self.alarm[1] = 0; // Triggers a slight change in Step, which helps the bounce effect
    }
}

var dist = point_distance(x, y, obj_battleBox.x, obj_battleBox.y);
self.image_angle = (self.image_angle + self.spin_speed) mod 360;
if (self.alarm[1] > -1) // set to -1 to have a slight "bounce" effect
{
    if (self.moving_inward) dist -= self.move_speed;
    else dist += self.move_speed;
}
self.x = obj_battleBox.x + lengthdir_x(dist, self.image_angle);
self.y = obj_battleBox.y + lengthdir_y(dist, self.image_angle);
