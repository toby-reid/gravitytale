/// @description Scuttle about

if (self.speed == 0)
{
    self.direction = (place_meeting(x, y, obj_battleBox) or distance_to_point(obj_battleBox.x, obj_battleBox.y) >= obj_battleBox.sprite_width / 2)
        ? point_direction(x, y, obj_battleBox.x, obj_battleBox.y) + irandom_range(-60, 60)
        : irandom(359);
    self.image_angle = self.direction;
    self.speed = 2;
    self.alarm[0] = irandom_range(10, 30);
}
else
{
    self.speed = 0;
    self.alarm[0] = irandom_range(20, 60);
}
